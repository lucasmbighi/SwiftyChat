import XCTest
@testable import SwiftyChat

final class LoginViewModelTests: XCTestCase {
    func testLoginSuccess_ShouldNavigateToHome() async {
        let coordinator = LoginCoordinatorSpy()
        let repository = LoginRepositoryMock(result: .success)
        let viewModel = LoginViewModel(coordinator: coordinator, repository: repository)
        
        await viewModel.login()
        
        XCTAssertTrue(coordinator.didGoToHome)
        XCTAssertNil(viewModel.errorMessage)
    }

    func testLoginFailure_WithKnownError_ShouldSetErrorMessage() async {
        let coordinator = LoginCoordinatorSpy()
        let repository = LoginRepositoryMock(result: .failure(LoginError.invalidLogin))
        let viewModel = LoginViewModel(coordinator: coordinator, repository: repository)
        
        await viewModel.login()
        
        XCTAssertFalse(coordinator.didGoToHome)
        XCTAssertEqual(viewModel.errorMessage, "Invalid email and/or password")
    }

    func testLoginFailure_WithUnknownError_ShouldSetGenericErrorMessage() async {
        let coordinator = LoginCoordinatorSpy()
        let repository = LoginRepositoryMock(result: .failure(NSError(domain: "test", code: 0)))
        let viewModel = LoginViewModel(coordinator: coordinator, repository: repository)
        
        await viewModel.login()
        
        XCTAssertFalse(coordinator.didGoToHome)
        XCTAssertEqual(viewModel.errorMessage, "Unknown error")
    }
}

import XCTest
@testable import SwiftyChat

final class OnboardingUsernameViewModelTests: XCTestCase {
    func testInvalidUsername() {
        let sut = makeSUT()
        sut.username = "john"
        sut.validateUsername()
        XCTAssertFalse(sut.isValidUsername)
    }
    
    func testValidUsername() {
        let sut = makeSUT()
        sut.username = "username"
        sut.validateUsername()
        XCTAssertTrue(sut.isValidUsername)
    }
    
    private func makeSUT() -> OnboardingUsernameViewModel {
        let repo = OnboardingUsernameRepository()
        let coordinator = OnboardingCoordinator()
        return OnboardingUsernameViewModel(coordinator: coordinator, repository: repo)
    }
}

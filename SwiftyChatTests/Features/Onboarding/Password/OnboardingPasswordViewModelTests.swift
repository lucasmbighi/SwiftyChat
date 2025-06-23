import XCTest
@testable import SwiftyChat

final class OnboardingPasswordViewModelTests: XCTestCase {
    func testInvalidPassword() {
        let sut = makeSUT()
        sut.password = "abc"
        sut.validatePassword()
        XCTAssertFalse(sut.isValidPassword)
    }
    
    func testValidEmail() {
        let sut = makeSUT()
        sut.password = "abc123"
        sut.validatePassword()
        XCTAssertTrue(sut.isValidPassword)
    }
    
    private func makeSUT() -> OnboardingPasswordViewModel {
        let repo = OnboardingPasswordRepository()
        let coordinator = OnboardingCoordinator()
        return OnboardingPasswordViewModel(coordinator: coordinator, repository: repo)
    }
}

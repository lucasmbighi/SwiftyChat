import XCTest
@testable import SwiftyChat

final class OnboardingPasswordViewModelTests: XCTestCase {
    func testInvalidPassword() {
        let sut = makeSUT()
        sut.password = "abc"
        sut.validatePassword()
        XCTAssertFalse(sut.isValidPassowrd)
    }
    
    func testValidEmail() {
        let sut = makeSUT()
        sut.password = "abc123"
        sut.validatePassword()
        XCTAssertTrue(sut.isValidPassowrd)
    }
    
    private func makeSUT() -> OnboardingPasswordViewModel {
        let repo = OnboardingPasswordRepository()
        let coordinator = OnboardingCoordinator()
        return OnboardingPasswordViewModel(coordinator: coordinator, repository: repo)
    }
}

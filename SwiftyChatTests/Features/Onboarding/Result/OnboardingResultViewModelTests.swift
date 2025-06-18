import XCTest
@testable import SwiftyChat

final class OnboardingResultViewModelTests: XCTestCase {
    func testFailureResult() {
        let sut = makeSUT(success: false)
        XCTAssertFalse(sut.success)
    }
    
    func testSuccessResult() {
        let sut = makeSUT(success: true)
        XCTAssertTrue(sut.success)
    }
    
    private func makeSUT(success: Bool) -> OnboardingResultViewModel {
        let coordinator = OnboardingCoordinator()
        return OnboardingResultViewModel(coordinator: coordinator, success: success)
    }
}

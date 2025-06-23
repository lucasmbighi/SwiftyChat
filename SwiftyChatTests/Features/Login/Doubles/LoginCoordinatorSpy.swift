import XCTest
import SwiftUI
@testable import SwiftyChat

final class LoginCoordinatorSpy: LoginCoordinating {
    private(set) var didGoToHome = false
    
    func start() -> some View {
        EmptyView()
    }
    
    func goToHome() {
        didGoToHome = true
    }
}

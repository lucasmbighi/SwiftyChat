import XCTest
import SwiftUI
@testable import SwiftyChat

final class HomeCoordinatorSpy: HomeCoordinating {
    private(set) var didGoToChatDetail = false
    private(set) var chatUsedForDetail: Chat?

    func start(loggedUser: User) -> any View {
        EmptyView()
    }
    
    func goToChatDetail(_ chat: Chat) {
        didGoToChatDetail = true
        chatUsedForDetail = chat
    }
}

import SwiftUI

protocol HomeCoordinating {
    associatedtype HomeView = View
    func start() -> HomeView
    func goToChatDetail(_ chat: Chat)
}

final class HomeCoordinator: HomeCoordinating {
    func start() -> some View {
        NavigationStack {
            HomeFactory.make(coordinator: self)
        }
    }
    
    func goToChatDetail(_ chat: Chat) {
        
    }
}

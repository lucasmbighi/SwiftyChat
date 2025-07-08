import SwiftUI

protocol HomeCoordinating {
    associatedtype HomeView = View
    func start(loggedUser: User) -> HomeView
    func goToChatDetail(_ chat: Chat)
}

final class HomeCoordinator: HomeCoordinating {
    func start(loggedUser: User) -> some View {
        NavigationStack {
            HomeFactory.make(coordinator: self, loggedUser: loggedUser)
        }
    }
    
    func goToChatDetail(_ chat: Chat) {
        
    }
}

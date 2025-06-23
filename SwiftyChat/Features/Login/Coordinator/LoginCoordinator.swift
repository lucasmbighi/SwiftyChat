import SwiftUI

protocol LoginCoordinating {
    associatedtype LoginView = View
    func start() -> LoginView
    func goToHome()
}

final class LoginCoordinator: LoginCoordinating {
    func start() -> some View {
        NavigationStack {
            LoginFactory.make(coordinator: self)
        }
    }
    
    func goToHome() {
        // TODO: home feature
    }
}

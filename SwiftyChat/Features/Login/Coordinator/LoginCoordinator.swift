import SwiftUI

final class LoginCoordinator: ObservableObject {
    init() { }
    
    func start() -> some View {
        NavigationStack {
            LoginFactory.make(coordinator: self)
        }
    }
    
    func goToHome() {
        // TODO: home feature
    }
}

import SwiftUI

final class LoginCoordinator: ObservableObject {
    @State var path = NavigationPath()
    
    init() { }
    
    func start() -> some View {
        NavigationStack(path: $path) {
            LoginFactory.make(coordinator: self)
        }
    }
    
    func goToHome() {
        // TODO: home feature
    }
}

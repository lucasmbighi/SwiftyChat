import SwiftUI

final class LoginFactory {
    static func make(coordinator: LoginCoordinator) -> some View {
        let repository = LoginRepository()
        let viewModel = LoginViewModel(coordinator: coordinator, repository: repository)
        return LoginView(viewModel: viewModel)
    }
}

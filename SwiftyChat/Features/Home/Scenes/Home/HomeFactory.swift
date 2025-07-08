import SwiftUI

final class HomeFactory {
    static func make(coordinator: HomeCoordinator, loggedUser: User) -> some View {
        let repository = HomeRepository()
        let viewModel = HomeViewModel(coordinator: coordinator, repository: repository, loggedUser: loggedUser)
        return HomeView(viewModel: viewModel)
    }
}

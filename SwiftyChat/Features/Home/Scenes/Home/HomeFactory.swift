import SwiftUI

final class HomeFactory {
    static func make(coordinator: HomeCoordinator) -> some View {
        let repository = HomeRepository()
        let viewModel = HomeViewModel(coordinator: coordinator, repository: repository)
        return HomeView(viewModel: viewModel)
    }
}

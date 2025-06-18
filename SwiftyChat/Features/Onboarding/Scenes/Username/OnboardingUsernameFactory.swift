import SwiftUI

final class OnboardingUsernameFactory {
    static func make(coordinator: OnboardingCoordinator) -> some View {
        let repository = OnboardingUsernameRepository()
        let viewModel = OnboardingUsernameViewModel(coordinator: coordinator, repository: repository)
        return OnboardingUsernameView(viewModel: viewModel)
    }
}

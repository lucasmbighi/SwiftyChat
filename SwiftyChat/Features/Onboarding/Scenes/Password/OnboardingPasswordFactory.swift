import SwiftUI

final class OnboardingPasswordFactory {
    static func make(coordinator: OnboardingCoordinator) -> some View {
        let repository = OnboardingPasswordRepository()
        let viewModel = OnboardingPasswordViewModel(coordinator: coordinator, repository: repository)
        return OnboardingPasswordView(viewModel: viewModel)
    }
}

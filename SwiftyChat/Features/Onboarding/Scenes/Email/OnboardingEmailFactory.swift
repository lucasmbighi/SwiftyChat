import SwiftUI

final class OnboardingEmailFactory {
    static func make(coordinator: OnboardingCoordinator) -> some View {
        let repository = OnboardingEmailRepository()
        let viewModel = OnboardingEmailViewModel(coordinator: coordinator, repository: repository)
        return OnboardingEmailView(viewModel: viewModel)
    }
}

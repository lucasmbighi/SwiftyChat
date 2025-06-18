import SwiftUI

final class OnboardingResultFactory {
    static func make(coordinator: OnboardingCoordinator, success: Bool) -> some View {
        let viewModel = OnboardingResultViewModel(coordinator: coordinator, success: success)
        return OnboardingResultView(viewModel: viewModel)
    }
}

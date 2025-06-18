//
//  OnboardingResultFactory.swift
//  SwiftChat
//
//  Created by Lucas Bighi on 09/06/25.
//

import SwiftUI

final class OnboardingResultFactory {
    static func make(coordinator: OnboardingCoordinator, success: Bool) -> some View {
        let viewModel = OnboardingResultViewModel(coordinator: coordinator, success: success)
        return OnboardingResultView(viewModel: viewModel)
    }
}

//
//  OnboardingUsernameFactory.swift
//  SwiftChat
//
//  Created by Lucas Bighi on 09/06/25.
//

import SwiftUI

final class OnboardingUsernameFactory {
    static func make(coordinator: OnboardingCoordinator) -> some View {
        let repository = OnboardingUsernameRepository()
        let viewModel = OnboardingUsernameViewModel(coordinator: coordinator, repository: repository)
        return OnboardingUsernameView(viewModel: viewModel)
    }
}

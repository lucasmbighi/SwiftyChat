//
//  OnboardingResultViewModel.swift
//  SwiftChat
//
//  Created by Lucas Bighi on 09/06/25.
//

import Foundation

protocol OnboardingResultViewModelProtocol: ObservableObject {
    var animate: Bool { get set }
    var success: Bool { get set }

    func goToHome()
    func backToLogin()
}

final class OnboardingResultViewModel: OnboardingResultViewModelProtocol {
    private let coordinator: OnboardingCoordinator

    @Published var animate: Bool = false
    
    var success: Bool
    
    init(coordinator: OnboardingCoordinator, success: Bool) {
        self.coordinator = coordinator
        self.success = success
    }
    
    func goToHome() {
        coordinator.goToHome()
    }
    
    func backToLogin() {
        coordinator.backToLogin()
    }
}

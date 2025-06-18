//
//  OnboardingEmailViewModel.swift
//  SwiftChat
//
//  Created by Lucas Bighi on 09/06/25.
//

import Foundation

protocol OnboardingEmailViewModelProtocol: ObservableObject {
    var email: String { get set }
    var isCheckingEmail: Bool { get set }
    var isValidEmail: Bool { get set }
    var isEmailUsed: Bool { get set }
    
    func validateEmail()
    func checkEmailIsUsed() async
    func goToUsername()
}

final class OnboardingEmailViewModel: OnboardingEmailViewModelProtocol {
    private let coordinator: OnboardingCoordinator
    private let repository: OnboardingEmailRepositable
    
    @Published var email: String = ""
    @Published var isCheckingEmail: Bool = false
    @Published var isValidEmail: Bool = false
    @Published var isEmailUsed: Bool = false
    
    init(coordinator: OnboardingCoordinator, repository: OnboardingEmailRepositable) {
        self.coordinator = coordinator
        self.repository = repository
    }
    
    func validateEmail() {
        isValidEmail = email.isValidEmail
    }
    
    func checkEmailIsUsed() async {
        isCheckingEmail = true
        do {
            let isEmailUsed = try await repository.checkEmailIsUsed()
            isValidEmail = !isEmailUsed
        } catch {
            isValidEmail = false
        }
        isCheckingEmail = false
    }
    
    func goToUsername() {
        coordinator.credentials.email = email
        coordinator.goToUsername()
    }
}

import Foundation

protocol OnboardingPasswordViewModelProtocol: ObservableObject {
    var password: String { get set }
    var isValidPassword: Bool { get set }
    var isCreatingAccount: Bool { get set }
    
    func validatePassword()
    func createAccount() async
}

final class OnboardingPasswordViewModel: OnboardingPasswordViewModelProtocol {
    private let coordinator: OnboardingCoordinator
    private let repository: OnboardingPasswordRepositable
    
    @Published var password: String = ""
    @Published var isValidPassword: Bool = false
    @Published var isCreatingAccount: Bool = false
    
    init(coordinator: OnboardingCoordinator, repository: OnboardingPasswordRepositable) {
        self.coordinator = coordinator
        self.repository = repository
    }
    
    func validatePassword() {
        isValidPassword = password.isValidPassword
    }
    
    func createAccount() async {
        isCreatingAccount = true
        coordinator.credentials.password = password
        do {
            try await repository.save(coordinator.credentials)
            coordinator.credentials.success = true
        } catch {
            coordinator.credentials.success = false
        }
        isCreatingAccount = false
        coordinator.goToResult()
    }
}

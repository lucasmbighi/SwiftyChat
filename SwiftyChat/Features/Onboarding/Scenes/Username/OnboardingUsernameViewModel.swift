import Foundation

protocol OnboardingUsernameViewModelProtocol: ObservableObject {
    var username: String { get set }
    var isCheckingUsername: Bool { get set }
    var isValidUsername: Bool { get set }
    var isUsernameUsed: Bool { get set }
    
    func validateUsername()
    func checkUsernameIsUsed() async
    func goToPassword()
}

final class OnboardingUsernameViewModel: OnboardingUsernameViewModelProtocol {
    private let coordinator: OnboardingCoordinator
    private let repository: OnboardingUsernameRepositable
    
    @Published var username: String = ""
    @Published var isCheckingUsername: Bool = false
    @Published var isValidUsername: Bool = false
    @Published var isUsernameUsed: Bool = false
    
    init(coordinator: OnboardingCoordinator, repository: OnboardingUsernameRepositable) {
        self.coordinator = coordinator
        self.repository = repository
    }
    
    func validateUsername() {
        isValidUsername = username.count >= 6
    }
    
    func checkUsernameIsUsed() async {
        do {
            let isUsernameUsed = try await repository.checkUsernameIsUsed()
            isValidUsername = !isUsernameUsed
        } catch {
            isValidUsername = false
        }
    }
    
    func goToPassword() {
        coordinator.credentials.username = username
        coordinator.goToPassword()
    }
}

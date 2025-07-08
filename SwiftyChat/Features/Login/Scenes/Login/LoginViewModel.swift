import Foundation

protocol LoginViewModelProtocol: ObservableObject {
    var email: String { get set }
    var password: String { get set }
    var isLoggingIn: Bool { get set }
    var errorMessage: String? { get set }
    
    func login() async
}

final class LoginViewModel: LoginViewModelProtocol {
    private let coordinator: any LoginCoordinating
    private let repository: LoginRepositable
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isLoggingIn: Bool = false
    @Published var errorMessage: String?
    
    init(coordinator: any LoginCoordinating, repository: LoginRepositable) {
        self.coordinator = coordinator
        self.repository = repository
    }
    
    func login() async {
        do {
            try await repository.login()
            coordinator.goToHome()
        } catch {
          errorMessage = (error as? LoginError)?.errorDescription ?? "Unknown error"
        }
    }
}

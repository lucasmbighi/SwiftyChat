import Foundation

protocol OnboardingPasswordRepositable {
    func save(_ user: UserCredentials) async throws
}

final class OnboardingPasswordRepository: OnboardingPasswordRepositable {
    func save(_ user: UserCredentials) async throws {
        
    }
}

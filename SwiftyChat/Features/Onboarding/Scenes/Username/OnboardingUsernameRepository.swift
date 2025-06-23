import Foundation

protocol OnboardingUsernameRepositable {
    func checkUsernameIsUsed() async throws -> Bool
}

final class OnboardingUsernameRepository: OnboardingUsernameRepositable {
    func checkUsernameIsUsed() async throws -> Bool {
        true
    }
}

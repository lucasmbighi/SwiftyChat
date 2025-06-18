import Foundation

protocol OnboardingEmailRepositable {
    func checkEmailIsUsed() async throws -> Bool
}

final class OnboardingEmailRepository: OnboardingEmailRepositable {
    func checkEmailIsUsed() async throws -> Bool {
        true
    }
}

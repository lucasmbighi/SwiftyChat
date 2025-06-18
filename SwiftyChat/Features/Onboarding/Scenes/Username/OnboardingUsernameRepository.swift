//
//  OnboardingUsernameRepository.swift
//  SwiftChat
//
//  Created by Lucas Bighi on 09/06/25.
//

import Foundation

protocol OnboardingUsernameRepositable {
    func checkUsernameIsUsed() async throws -> Bool
}

final class OnboardingUsernameRepository: OnboardingUsernameRepositable {
    func checkUsernameIsUsed() async throws -> Bool {
        true
    }
}

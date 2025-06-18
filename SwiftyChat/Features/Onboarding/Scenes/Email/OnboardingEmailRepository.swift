//
//  OnboardingEmailRepository.swift
//  SwiftChat
//
//  Created by Lucas Bighi on 09/06/25.
//

import Foundation

protocol OnboardingEmailRepositable {
    func checkEmailIsUsed() async throws -> Bool
}

final class OnboardingEmailRepository: OnboardingEmailRepositable {
    func checkEmailIsUsed() async throws -> Bool {
        true
    }
}

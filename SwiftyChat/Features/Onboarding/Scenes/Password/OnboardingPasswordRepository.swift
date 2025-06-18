//
//  OnboardingPasswordRepository.swift
//  SwiftChat
//
//  Created by Lucas Bighi on 09/06/25.
//

import Foundation

protocol OnboardingPasswordRepositable {
    func save(_ user: UserCredentials) async throws
}

final class OnboardingPasswordRepository: OnboardingPasswordRepositable {
    func save(_ user: UserCredentials) async throws {
        
    }
}

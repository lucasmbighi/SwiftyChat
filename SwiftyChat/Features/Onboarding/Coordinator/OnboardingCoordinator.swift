//
//  OnboardingCoordinator.swift
//  SwiftChat
//
//  Created by Lucas Bighi on 09/06/25.
//

import SwiftUI

final class OnboardingCoordinator: ObservableObject {
    @State var path = NavigationPath()
    @Published var credentials = UserCredentials()
    
    init() { }
    
    func start() -> some View {
        NavigationStack(path: $path) {
            OnboardingEmailFactory.make(coordinator: self)
                .navigationDestination(for: String.self) { screen in
                    switch screen {
                    case "Username":
                        OnboardingUsernameFactory.make(coordinator: self)
                    case "Password":
                        OnboardingPasswordFactory.make(coordinator: self)
                    case "Result":
                        OnboardingResultFactory.make(coordinator: self, success: self.credentials.success)
                    default:
                        Text("Welcome")
                    }
                }
        }
    }
    
    func goToUsername() {
        path.append("Username")
    }
    
    func goToPassword() {
        path.append("Password")
    }
    
    func goToResult() {
        path.append("Result")
    }
    
    func backToLogin() {
        path.removeLast(path.count)
    }
    
    func goToHome() {
        // TODO: home feature
    }
    
    func backToPrevious() {
        path.removeLast()
    }
}

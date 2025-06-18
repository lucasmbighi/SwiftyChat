//
//  OnboardingEmailView.swift
//  SwiftChat
//
//  Created by Lucas Bighi on 09/06/25.
//

import SwiftUI

struct OnboardingEmailView<ViewModel: OnboardingEmailViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            Spacer()
            
            TextField("Email", text: $viewModel.email)
                .keyboardType(.emailAddress)
                .textContentType(.emailAddress)
                .autocapitalization(.none)
                .textFieldStyle(.roundedBorder)
                .onChange(of: viewModel.email) { _, _ in
                    viewModel.validateEmail()
                }
            
            Button {
                Task {
                    await viewModel.checkEmailIsUsed()
                }
            } label: {
                Text("Check email")
            }
            .disabled(!viewModel.isValidEmail)
            
            Spacer()
            
            Button("Avançar", action: viewModel.goToUsername)
                .disabled(!viewModel.isEmailUsed)
        }
        .padding()
    }
}

#Preview {
    OnboardingEmailFactory.make(coordinator: .init())
}

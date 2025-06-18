import SwiftUI

struct OnboardingPasswordView<ViewModel: OnboardingPasswordViewModel>: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            SecureField("Senha", text: $viewModel.password)
                .textFieldStyle(.roundedBorder)
                .onChange(of: viewModel.password) { _, _ in
                    viewModel.validatePassword()
                }
            
            Button("Criar conta") {
                Task {
                    await viewModel.createAccount()
                }
            }
            .disabled(!viewModel.isValidPassowrd)
        }
        .padding()
    }
}

#Preview {
    OnboardingPasswordFactory.make(coordinator: .init())
}

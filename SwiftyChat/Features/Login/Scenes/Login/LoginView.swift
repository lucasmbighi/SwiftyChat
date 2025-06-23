import SwiftUI

struct LoginView<ViewModel: LoginViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            Spacer()
            
            TextField("Email", text: $viewModel.email)
                .keyboardType(.emailAddress)
                .textContentType(.emailAddress)
                .autocapitalization(.none)
                .textFieldStyle(.roundedBorder)
            
            SecureField("Password", text: $viewModel.password)
                .autocapitalization(.none)
                .textFieldStyle(.roundedBorder)

            Button {
                Task {
                    await viewModel.login()
                }
            } label: {
                Text("Login")
            }
            .disabled(!viewModel.email.isValidEmail && !viewModel.password.isValidPassword)
        }
        .padding()
    }
}

#Preview {
    LoginFactory.make(coordinator: .init())
}

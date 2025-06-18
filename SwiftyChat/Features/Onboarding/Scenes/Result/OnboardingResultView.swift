import SwiftUI

struct OnboardingResultView<ViewModel: OnboardingResultViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        Group {
            if viewModel.success {
                successView
            } else {
                failureView
            }
        }
        .padding()
    }
    
    private var successView: some View {
        VStack {
            Spacer()
            Image(systemName: "checkmark.circle.fill")
                .font(.system(size: 80))
                .foregroundStyle(.green)
                .symbolEffect(.bounce, value: viewModel.animate)
                .onAppear {
                    viewModel.animate = true
                }
            
            Text("Success creating your account")
                .font(.title)
                .padding(.vertical)
            
            Text("You can now use our chat")
                .font(.body)
            Spacer()
            Button("Enjoy", action: viewModel.goToHome)
        }
    }
    
    private var failureView: some View {
        VStack {
            Spacer()
            Image(systemName: "x.circle.fill")
                .font(.system(size: 80))
                .foregroundStyle(.red)
                .symbolEffect(.bounce, value: viewModel.animate)
                .onAppear {
                    viewModel.animate = true
                }
            
            Text("Failure creating your account")
                .font(.title)
                .padding(.vertical)
            
            Text("Try again later")
                .font(.body)
            Spacer()
            Button("Understood", action: viewModel.backToLogin)
        }
    }
}

#Preview {
    OnboardingResultFactory.make(coordinator: .init(), success: false)
}

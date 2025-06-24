import SwiftUI

struct HomeView<ViewModel: HomeViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            List(viewModel.chats) { chat in
                VStack {
                    HStack {
                        Text(viewModel.participant(of: chat).username)
                        Text(chat.messages.last?.date.formatted(date: .omitted, time: .shortened) ?? "")
                    }
                    Text(chat.messages.last?.content ?? "")
                }
            }
        }
        .padding()
    }
}

#Preview {
    HomeFactory.make(coordinator: .init())
}

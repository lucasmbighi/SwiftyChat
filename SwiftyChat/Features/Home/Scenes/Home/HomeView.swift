import SwiftUI

struct HomeView<ViewModel: HomeViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel

    var body: some View {
        List(viewModel.chats) { chat in
            messageView(
                of: chat,
                isFromCurrentUser: viewModel.isFromCurrentUser(chat.messages.last)
            )
        }
        .task {
            await viewModel.fetchChats()
        }
        .navigationTitle("Chats")
    }

    private func messageView(
        of chat: Chat,
        isFromCurrentUser: Bool
    ) -> some View {
        VStack {
            HStack {
                Text(viewModel.participant(of: chat)?.username ?? "")
                    .font(.headline)
                Spacer()
                Text(chat.messages.last?.date.formatted(date: .omitted, time: .shortened) ?? "")
                    .font(.callout)
            }
            HStack {
                if !isFromCurrentUser {
                    image(of: chat.messages.last?.status ?? .sent)
                }
                Text(chat.messages.last?.content ?? "")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.body)
            }
        }
        .bold(chat.messages.last?.status == .read)
        .onTapGesture {
            viewModel.goToChatDetail(chat)
        }
    }

    private func image(of status: Message.Status) -> some View {
        switch status {
        case .sending:
            Image(systemName: "clock")
        case .sent:
            Image(systemName: "paperplane")
        case .delivered:
            Image(systemName: "check")
        case .read:
            Image(systemName: "eye")
        }
    }
}

#Preview {
    let repository = HomeRepositoryMock()
    let viewModel = HomeViewModel(
        coordinator: HomeCoordinator(),
        repository: repository,
        loggedUser: .mockLinus
    )
    return NavigationView {
        HomeView(viewModel: viewModel)
    }
}

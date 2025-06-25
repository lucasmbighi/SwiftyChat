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
                    .font(.subheadline)
            }
        }
        .bold(isFromCurrentUser && chat.messages.last?.status != .read)
        .onTapGesture {
            viewModel.goToChatDetail(chat)
        }
        .swipeActions(edge: .leading, allowsFullSwipe: true, content: {
            Button {
                Task {
                    await viewModel.delete(chat)
                }
            } label: {
                Image(systemName: "trash")
            }
            .tint(.red)
        })
    }

    private func image(of status: Message.Status) -> some View {
        Group {
            switch status {
            case .sending:
                Image(systemName: "clock")
            case .sent:
                Image(systemName: "checkmark")
            case .delivered:
                HStack(spacing: -10) {
                    Image(systemName: "checkmark")
                    Image(systemName: "checkmark")
                }
            case .read:
                HStack(spacing: -10) {
                    Image(systemName: "checkmark")
                    Image(systemName: "checkmark")
                }
                .foregroundStyle(.blue)
            }
        }
    }
}

#Preview {
    let repository = HomeRepositoryMock(chats: [
        Chat(
            id: UUID(),
            participants: [.mockAda, .mockLinus],
            messages: [
                Message(
                    id: UUID(),
                    sender: .mockAda,
                    content: "Hello, Linus",
                    date: .now,
                    status: .sent
                ),
                Message(
                    id: UUID(),
                    sender: .mockLinus,
                    content: "Hello, Ada",
                    date: .now,
                    status: .delivered
                )
            ]
        ),
        Chat(
            id: UUID(),
            participants: [.mockTuring, .mockLinus],
            messages: [
                Message(
                    id: UUID(),
                    sender: .mockTuring,
                    content: "Hello, Linus",
                    date: .now,
                    status: .read
                )
            ]
        )
    ])
    let viewModel = HomeViewModel(
        coordinator: HomeCoordinator(),
        repository: repository,
        loggedUser: .mockLinus
    )
    return NavigationView {
        HomeView(viewModel: viewModel)
    }
}

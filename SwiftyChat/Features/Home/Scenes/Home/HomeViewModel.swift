import Foundation

protocol HomeViewModelProtocol: ObservableObject {
    var chats: [Chat] { get set }

    func fetchChats() async
    func goToChatDetail(_ chat: Chat)
    func delete(_ chat: Chat) async
    func participant(of chat: Chat) -> User?
    func isFromCurrentUser(_ message: Message?) -> Bool
}

final class HomeViewModel: HomeViewModelProtocol {
    private let coordinator: any HomeCoordinating
    private let repository: HomeRepositable
    private let loggedUser: User
    
    @Published var chats: [Chat] = []
    @Published var errorMessage: String?
    
    init(coordinator: any HomeCoordinating, repository: HomeRepositable, loggedUser: User) {
        self.coordinator = coordinator
        self.repository = repository
        self.loggedUser = loggedUser
    }

    func fetchChats() async {
        do {
            chats = try await repository.fetchChats()
        } catch {
          errorMessage = (error as? ChatError)?.errorDescription ?? "Unknown error"
        }
    }

    func goToChatDetail(_ chat: Chat) {
        coordinator.goToChatDetail(chat)
    }
    
    func delete(_ chat: Chat) async {
        do {
            try await repository.delete(chat)
        } catch {
          errorMessage = (error as? ChatError)?.errorDescription ?? "Unknown error"
        }
    }

    func participant(of chat: Chat) -> User? {
        chat.participants.first(where: { $0 != loggedUser })
    }

    func isFromCurrentUser(_ message: Message?) -> Bool {
        guard let message else { return true }
        return message.sender == loggedUser
    }
}

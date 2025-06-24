import Foundation

protocol HomeViewModelProtocol: ObservableObject {
    var chats: [Chat] { get set }

    func fetchChats() async
    func delete(_ chat: Chat) async throws
    func participant(of chat: Chat) -> User?
}

final class HomeViewModel: HomeViewModelProtocol {
    private let coordinator: any HomeCoordinating
    private let repository: HomeRepositable
    private let loggedUser: User
    
    @Published var chats: [Chat] = []
    
    init(coordinator: any HomeCoordinating, repository: HomeRepositable, loggedUser: User) {
        self.coordinator = coordinator
        self.repository = repository
        self.loggedUser = loggedUser
    }

    func fetchChats() async {
        do {
            try await repository.fetchChats()
        } catch {

        }
    }

    func delete(_ chat: Chat) async throws {
        do {
            try await repository.delete(chat)
        } catch {

        }
    }

    func participant(of chat: Chat) -> User? {
        chat.participants.first(where: { $0.id != loggedUser.id })
    }
}

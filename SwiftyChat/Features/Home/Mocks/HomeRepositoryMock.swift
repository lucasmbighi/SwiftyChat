#if DEBUG
final class HomeRepositoryMock: HomeRepositable {
    let chats: [Chat]

    init(chats: [Chat]) {
        self.chats = chats
    }

    func fetchChats() async throws -> [Chat] {
        chats
    }

    func delete(_ chat: Chat) async throws { }
}
#endif

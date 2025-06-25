#if DEBUG
final class HomeRepositoryMock: HomeRepositable {
    func fetchChats() async throws -> [Chat] {
        .turingMocks
    }

    func delete(_ chat: Chat) async throws { }
}
#endif

import Foundation

protocol HomeRepositable {
    func fetchChats() async throws -> [Chat]
    func delete(_ chat: Chat) async throws
}

final class HomeRepository: HomeRepositable {
    func fetchChats() async throws -> [Chat] {
        []
    }

    func delete(_ chat: Chat) async throws {

    }
}

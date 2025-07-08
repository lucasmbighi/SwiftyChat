import XCTest
@testable import SwiftyChat

final class HomeRepositoryMock: HomeRepositable {
    enum ResultType {
        case success, failure(Error)
    }

    let result: ResultType
    
    init(result: ResultType) {
        self.result = result
    }

    private(set) var mockChats = [
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
    ]

    func fetchChats() async throws -> [Chat] {
        switch result {
        case .success:
            return mockChats
        case .failure(let error):
            throw error
        }
    }

    func delete(_ chat: Chat) async throws {
        switch result {
        case .success:
            mockChats.removeAll(where: { $0.id == chat.id })
            return
        case .failure(let error):
            throw error
        }
    }
}

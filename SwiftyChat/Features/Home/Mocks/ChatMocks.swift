import Foundation

#if DEBUG
extension Chat {
    static func mock(with participants: [User]) -> Chat {
        Chat(
            id: UUID(),
            participants: participants,
            messages: .mock(with: participants)
        )
    }
    
    static let mockLinusXAda: Chat = .mock(with: [.mockLinus, .mockAda])

    static let mockLinusXTuring: Chat = .mock(with: [.mockLinus, .mockTuring])

    static let mockAdaXTuring: Chat = .mock(with: [.mockAda, .mockTuring])
}

extension [Chat] {
    static var turingMocks: [Chat] = [.mockLinusXTuring, .mockAdaXTuring]
}
#endif

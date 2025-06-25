import Foundation

#if DEBUG
extension [Message] {
    static func mock(with participants: [User]) -> [Message] {
        participants.map {
            Message(
                id: UUID(),
                sender: $0,
                content: "Hello World",
                date: .now,
                status: .sending
            )
        }
    }
}
#endif

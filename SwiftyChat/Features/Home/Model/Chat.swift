import Foundation

struct Chat: Decodable, Identifiable {
    let id: UUID
    let participants: [User]
    let messages: [Message]
}

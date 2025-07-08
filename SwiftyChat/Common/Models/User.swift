import Foundation

struct User: Decodable, Identifiable, Equatable {
    let id: UUID
    let username: String
    let email: String
}

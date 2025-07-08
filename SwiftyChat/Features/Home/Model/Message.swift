import Foundation

struct Message: Decodable, Identifiable {
    enum Status: String, Decodable {
        case sending
        case sent
        case delivered
        case read
    }
    
    let id: UUID
    let sender: User
    let content: String
    let date: Date
    let status: Status
}

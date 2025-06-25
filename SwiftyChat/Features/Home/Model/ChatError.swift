import Foundation

enum ChatError: LocalizedError {
    case unableToFetch
    case unableToDelete
    
    var errorDescription: String? {
        switch self {
        case .unableToFetch:
            return "Sorry, there was an error while fetching your chats.\nPlease, try again later."
        case .unableToDelete:
            return "Sorry, there was an error while deleting your chat.\nPlease, try again later."
        }
    }
}

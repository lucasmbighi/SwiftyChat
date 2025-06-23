import Foundation

enum LoginError: LocalizedError {
    case invalidLogin
    
    var errorDescription: String? {
        switch self {
        case .invalidLogin:
            return "Invalid email and/or password"
        }
    }
}

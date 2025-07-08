import Foundation

final class AuthManager: ObservableObject {
    @Published private(set) var user: User?
    private(set) var token: String?
    
    func saveSession(_ auth: AuthResponse) {
        self.user = auth.user
        self.token = auth.token
    }

    func logout() {
        self.user = nil
        self.token = nil
    }
}

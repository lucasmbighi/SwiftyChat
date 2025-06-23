import Foundation

extension String {
    var isValidPassword: Bool {
        self.count >= 6
    }
}

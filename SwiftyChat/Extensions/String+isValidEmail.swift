import Foundation

extension String {
    var isValidEmail: Bool {
        self.contains("@") && self.contains(".")
    }
}

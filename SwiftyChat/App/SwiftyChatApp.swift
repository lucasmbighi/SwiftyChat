import SwiftUI

@main
struct SwiftyChatApp: App {
    var body: some Scene {
        WindowGroup {
            LoginCoordinator().start()
        }
    }
}

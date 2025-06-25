import Foundation

#if DEBUG
extension User {
    static let mockLinus = User(
        id: UUID(uuidString: "00000000-0000-0000-0000-000000000001")!,
        username: "linus",
        email: "linus@kernel.org"
    )

    static let mockAda = User(
        id: UUID(uuidString: "00000000-0000-0000-0000-000000000002")!,
        username: "ada",
        email: "ada@lovelace.dev"
    )

    static let mockTuring = User(
        id: UUID(uuidString: "00000000-0000-0000-0000-000000000003")!,
        username: "turing",
        email: "alan@enigma.ai"
    )
}

extension [User] {
    static let allMocks: [User] = [.mockLinus, .mockAda, .mockTuring]
}
#endif

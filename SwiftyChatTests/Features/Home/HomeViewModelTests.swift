import XCTest
@testable import SwiftyChat

final class HomeViewModelTests: XCTestCase {
    func testFetchChatsSuccess_ShouldReturnChats() async {
        let coordinator = HomeCoordinatorSpy()
        let repository = HomeRepositoryMock(result: .success)
        let viewModel = HomeViewModel(coordinator: coordinator, repository: repository, loggedUser: .mockLinus)
        
        await viewModel.fetchChats()
        
        XCTAssertEqual(viewModel.chats.count, 2)
        XCTAssertNil(viewModel.errorMessage)
    }

    func testFetchChatsFailure_WithKnownError_ShouldSetErrorMessage() async {
        let coordinator = HomeCoordinatorSpy()
        let repository = HomeRepositoryMock(result: .failure(ChatError.unableToFetch))
        let viewModel = HomeViewModel(coordinator: coordinator, repository: repository, loggedUser: .mockLinus)
        
        await viewModel.fetchChats()
        
        XCTAssertEqual(viewModel.chats.count, 0)
        XCTAssertEqual(viewModel.errorMessage, "Sorry, there was an error while fetching your chats.\nPlease, try again later.")
    }

    func testFetchChatsFailure_WithUnknownError_ShouldSetGenericErrorMessage() async {
        let coordinator = HomeCoordinatorSpy()
        let repository = HomeRepositoryMock(result: .failure(NSError(domain: "test", code: 0)))
        let viewModel = HomeViewModel(coordinator: coordinator, repository: repository, loggedUser: .mockLinus)
        
        await viewModel.fetchChats()
        
        XCTAssertEqual(viewModel.chats.count, 0)
        XCTAssertEqual(viewModel.errorMessage, "Unknown error")
    }

    func testGoToChatDetail_ShouldMatchChat() {
        let coordinator = HomeCoordinatorSpy()
        let repository = HomeRepositoryMock(result: .success)
        let viewModel = HomeViewModel(coordinator: coordinator, repository: repository, loggedUser: .mockLinus)
        let mockChat = Chat(
            id: UUID(),
            participants: [.mockAda, .mockLinus],
            messages: [
                Message(
                    id: UUID(uuidString: "00000000-0000-0000-0000-000000000001")!,
                    sender: .mockAda,
                    content: "Hello, Linus",
                    date: .now,
                    status: .sent
                ),
                Message(
                    id: UUID(uuidString: "00000000-0000-0000-0000-000000000002")!,
                    sender: .mockLinus,
                    content: "Hello, Ada",
                    date: .now,
                    status: .delivered
                )
            ]
        )

        viewModel.goToChatDetail(mockChat)
        XCTAssertEqual(coordinator.chatUsedForDetail?.id, mockChat.id)
        XCTAssertEqual(coordinator.chatUsedForDetail?.participants.count, 2)
        XCTAssertEqual(coordinator.chatUsedForDetail?.participants[0], .mockAda)
        XCTAssertEqual(coordinator.chatUsedForDetail?.participants[1], .mockLinus)
        XCTAssertEqual(coordinator.chatUsedForDetail?.messages.count, 2)
        XCTAssertEqual(coordinator.chatUsedForDetail?.messages[0].id, UUID(uuidString: "00000000-0000-0000-0000-000000000001"))
        XCTAssertEqual(coordinator.chatUsedForDetail?.messages[1].id, UUID(uuidString: "00000000-0000-0000-0000-000000000002"))
    }

    func testDeleteChatSuccess() async {
        let coordinator = HomeCoordinatorSpy()
        let repository = HomeRepositoryMock(result: .success)
        let viewModel = HomeViewModel(coordinator: coordinator, repository: repository, loggedUser: .mockLinus)
        
        await viewModel.fetchChats()

        XCTAssertEqual(viewModel.chats.count, 1)

        await viewModel.delete(viewModel.chats[0])

        XCTAssertEqual(viewModel.chats.count, 1)
        XCTAssertNil(viewModel.errorMessage)
    }

    func testDeleteChatFailure_WithKnownError_ShouldSetErrorMessage() async {
        let coordinator = HomeCoordinatorSpy()
        let repository = HomeRepositoryMock(result: .failure(ChatError.unableToDelete))
        let viewModel = HomeViewModel(coordinator: coordinator, repository: repository, loggedUser: .mockLinus)
        
        await viewModel.fetchChats()
        
        XCTAssertEqual(viewModel.chats.count, 2)

        await viewModel.delete(viewModel.chats[0])

        XCTAssertEqual(viewModel.chats.count, 2)
        XCTAssertEqual(viewModel.errorMessage, "Sorry, there was an error while deleting your chat.\nPlease, try again later.")
    }

    func testDeleteChatFailure_WithUnknownError_ShouldSetGenericErrorMessage() async {
        let coordinator = HomeCoordinatorSpy()
        let repository = HomeRepositoryMock(result: .failure(NSError(domain: "test", code: 0)))
        let viewModel = HomeViewModel(coordinator: coordinator, repository: repository, loggedUser: .mockLinus)
        
        await viewModel.fetchChats()
        
        XCTAssertEqual(viewModel.chats.count, 2)

        await viewModel.delete(viewModel.chats[0])

        XCTAssertEqual(viewModel.chats.count, 2)
        XCTAssertEqual(viewModel.errorMessage, "Unknown error")
    }
}

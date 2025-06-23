import XCTest
@testable import SwiftyChat

struct LoginRepositoryMock: LoginRepositable {
    enum ResultType {
        case success, failure(Error)
    }
    
    let result: ResultType
    
    func login() async throws {
        switch result {
        case .success:
            return
        case .failure(let error):
            throw error
        }
    }
}

import XCTest
@testable import NetworkLayer

final class APIHandlerTests: XCTestCase {

    var endpoint: String = ""
    var sut: APIHandler!
    
    func testAPIHandlerInstantiation() {
        sut = APIHandler(endpoint: endpoint)
        
        XCTAssertNotNil(sut)
    }
    
    func testAPICallWithEmptyURL() {
        endpoint = ""
        sut = APIHandler(endpoint: endpoint)
        
        sut.callAPI { result in
            switch result {
            case .failure(let error):
                if let resultError = error as? APIError {
                    XCTAssertEqual(resultError, APIError.badURL)
                }
                
            default:
                XCTFail("No error was thrown when expecting APIError.")
            }
        }
    }
}

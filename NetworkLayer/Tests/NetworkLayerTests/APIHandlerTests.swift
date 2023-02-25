import XCTest
import NetworkLayer

final class APIHandlerTests: XCTestCase {

    var endpoint: String = ""
    var sut: APIHandler!
    
    func testAPIHandlerInstantiation() {
        sut = APIHandler(endpoint: endpoint)
        
        XCTAssertNotNil(sut)
    }
    
    func testAPICallWithInvalidEndpoint() {
        sut = APIHandler(endpoint: endpoint)
        
        var failedToCallAPI = false
        
        do {
            try sut.callAPI { _ in }
        } catch {
            failedToCallAPI = true
        }
        
        XCTAssertTrue(failedToCallAPI)
    }
}

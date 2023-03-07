import XCTest
@testable import NetworkLayer

final class APIRequestTests: XCTestCase {
    
    func testCreateRequestWithNilURL() {
        let url = URL(string: "")
        
        let request = APIRequest(url: url)
        
        XCTAssertNil(request)
    }
    
    func testCreateRequestWithInvalidURLs() {
        let invalidURLArray = [
            URL(string: "abcd"),
            URL(string: "testURL"),
            URL(string: "!@ˆ#(@*!$%ˆ)"),
            URL(string: "google.c"),
            URL(string: ".com"),
            URL(string: "https://"),
            URL(string: "http://"),
            URL(string: "")
        ]
        
        for invalidURL in invalidURLArray {
            
            let request = APIRequest(url: invalidURL)
            
            XCTAssertNil(request)
        }
    }
    
    func testCreateRequestWithValidURL() throws {
        
        let urlString = "www.google.com"
        
        let url = URL(string: urlString)
        
        if let apiRequest = APIRequest(url: url) {
            let htmlRequest = apiRequest.urlRequest
            
            let requestUrlString = htmlRequest.url?.absoluteString
            
            XCTAssertEqual(requestUrlString, urlString)
        }
    }
}

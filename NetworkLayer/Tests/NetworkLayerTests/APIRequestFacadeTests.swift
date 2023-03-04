import XCTest
@testable import NetworkLayer

final class APIRequestFacadeTests: XCTestCase {
    
    func testCreateRequestWithNilURL() {
        let url = URL(string: "")
        
        do {
            _ = try APIRequestFacade(url: url)
            
        } catch {
            if let requestError = error as? APIError {
                XCTAssertEqual(requestError, APIError.badURL)
            }
        }
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
            do {
                let request = try APIRequestFacade(url: invalidURL)
                XCTAssertNil(request)
                
            } catch {
                XCTAssertEqual(error as? APIError, APIError.badURL)
            }
        }
    }
    
    func testCreateRequestWithValidURL() throws {
        
        let urlString = "www.google.com"
        
        let url = URL(string: urlString)
        
        let apiRequest = try APIRequestFacade(url: url)
        
        let htmlRequest = apiRequest.getURLRequest()
        
        XCTAssertEqual(htmlRequest.url?.absoluteString, urlString)

    }
}

// swiftlint:disable force_unwrapping

import XCTest
@testable import NetworkLayer

final class APIHandlerTests: XCTestCase {

    var endpoint: String = "https://jsonplaceholder.typicode.com/"
    var sut: APIHandler!
    
    func testAPIHandlerInstantiation() {
        
        sut = APIHandler(endpoint: endpoint)
        
        XCTAssertNotNil(sut)
    }
    
    func testAPICallWithEmptyURL() {
        
        endpoint = ""
        sut = APIHandler(endpoint: endpoint)
        
        sut.request { result in
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
    
    func testAPICallMockingSessionWithError() {

        let mockSession = APISessionMock()
        
        mockSession.error = APIError.badURL

        sut = APIHandler(endpoint: endpoint, session: mockSession)
        
        sut.request { result in
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
    
    func testAPICallMockingSessionWithData() {

        let jsonString = "{\"id\": 1}"
        
        let mockSession = APISessionMock()
        mockSession.data = jsonString.data(using: .utf8)
        
        sut = APIHandler(endpoint: endpoint, session: mockSession)
        
        sut.request { result in
            switch result {
            case .success((let data, _)):
                if let data {
                    let dataAsString = String(data: data, encoding: .utf8)
                    XCTAssertEqual(dataAsString, jsonString)
                }
                
            case .failure:
                XCTFail("Unexpected error was thrown when calling function.")
            }
        }
    }
    
    func testAPICallMockingSessionWithDataAndResponse() {

        let jsonString = "{\"id\": 1}"
        let responseURL = "www.google.com"

        let mockSession = APISessionMock()
        mockSession.data = jsonString.data(using: .utf8)
        mockSession.response = HTTPURLResponse(url: URL(string: responseURL)!, statusCode: 200, httpVersion: "1.1", headerFields: nil)
        
        sut = APIHandler(endpoint: endpoint, session: mockSession)
        
        sut.request { result in
            switch result {
            case .success((let data, let response)):
                
                if let data {
                    let dataAsString = String(data: data, encoding: .utf8)
                    XCTAssertEqual(dataAsString, jsonString)
                }
                
                if let httpResponse = response as? HTTPURLResponse {
                    XCTAssertEqual(httpResponse.statusCode, 200)
                    XCTAssertEqual(httpResponse.url?.absoluteString, responseURL)
                }
                
            case .failure:
                XCTFail("Unexpected error was thrown when calling function.")
            }
        }
    }
}

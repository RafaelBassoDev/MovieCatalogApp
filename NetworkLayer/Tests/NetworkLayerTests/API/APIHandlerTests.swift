// swiftlint:disable force_unwrapping

import XCTest
@testable import NetworkLayer

final class APIHandlerTests: XCTestCase {

    var endpoint: String = "https://jsonplaceholder.typicode.com/"
    
    func testAPIHandlerInstantiation() {
        
        let apiHandler = APIHandler()
        
        XCTAssertNotNil(apiHandler)
    }
    
    func testApiRequestWithEmptyUrl() {
        
        let sut = APIHandler()
        
        let url = URL(string: "")
        
        let request = APIRequest(url: url)
        
        sut.request(request) { result in
            switch result {
            case .success:
                break
                
            case .failure(let error):
                if let resultError = error as? APIError {
                    XCTAssertEqual(resultError, APIError.badURL)
                }
            }
        }
    }
    
    func testAPICallMockingSessionWithError() {

        let mockSession = APISessionMock()
        mockSession.error = APIError.badURL

        let sut = APIHandler(session: mockSession)
        
        let request = APIRequest(url: URL(string: endpoint))
        
        sut.request(request) { result in
            switch result {
            case .success:
                break
                
            case .failure(let error):
                if let resultError = error as? APIError {
                    XCTAssertEqual(resultError, APIError.badURL)
                }
            }
        }
    }
    
    func testAPICallMockingSessionWithData() {

        let jsonString = "{\"id\": 1}"
        
        let mockSession = APISessionMock()
        mockSession.data = jsonString.data(using: .utf8)
        
        let sut = APIHandler(session: mockSession)
        
        let request = APIRequest(url: URL(string: endpoint))
        
        sut.request(request) { result in
            switch result {
            case .success((let data, _)):
                if let data {
                    let dataAsString = String(data: data, encoding: .utf8)
                    XCTAssertEqual(dataAsString, jsonString)
                }
                
            case .failure:
                break
            }
        }
    }
    
    func testAPICallMockingSessionWithDataAndResponse() {

        let jsonString = "{\"id\": 1}"
        
        let responseURL = "www.google.com"

        let mockSession = APISessionMock()
        mockSession.data = jsonString.data(using: .utf8)
        mockSession.response = HTTPURLResponse(url: URL(string: responseURL)!, statusCode: 200, httpVersion: "1.1", headerFields: nil)
        
        let sut = APIHandler(session: mockSession)
        
        let request = APIRequest(url: URL(string: endpoint))
        
        sut.request(request) { result in
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
                break
            }
        }
    }
}

import Foundation
import NetworkLayer

class APISessionMock: APISession {
    
    var data: Data?
    var response: URLResponse?
    var error: Error?
    
    func sendRequest(_ request: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        completion(data, response, error)
    }
}

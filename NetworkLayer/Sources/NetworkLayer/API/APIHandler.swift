import Foundation

public struct APIHandler {
    
    private let endpoint: String
    private let dataTaskhandler: APIDataTaskManager
    
    public init(endpoint: String, session: URLSession = URLSession.shared) {
        self.endpoint = endpoint
        self.dataTaskhandler = APIDataTaskManager(session: session)
    }
    
    public func callAPI(arguments: String = "", completion: @escaping (Result<(Data?, URLResponse?), Error>) -> Void ) throws {
        
        let URLString = self.endpoint + arguments
        
        let url = URL(string: URLString)
        
        guard let apiRequest = try? APIRequest(url: url) else {
            throw APIError.invalidRequest
        }
        
        dataTaskhandler.createRequest(request: apiRequest.getRequest()) { result in
            completion(result)
        }
    }
}

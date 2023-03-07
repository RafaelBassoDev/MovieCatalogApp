import Foundation

public struct APIHandler {
    
    private let endpoint: String
    private let session: APISession
    
    public init(endpoint: String, session: APISession = URLSession.shared) {
        self.endpoint = endpoint
        self.session = session
    }
    
    public func request(_ apiRequest: APIRequest?, completion: @escaping (Result<(Data?, URLResponse?), Error>) -> Void) {
        
        guard let apiRequest else {
            completion(.failure(APIError.invalidRequest))
            return
        }
        
        session.sendRequest(apiRequest.urlRequest) { data, response, error in
            if let error {
                completion(.failure(error))
                return
            }
            
            if let data {
                completion(.success((data, response)))
            }
        }
        
    }
    
    public func request(arguments: String = "", completion: @escaping (Result<(Data?, URLResponse?), Error>) -> Void ) {
        
        let urlString = self.endpoint + arguments
        
        let url = URL(string: urlString)
        
        let apiRequest = APIRequest(url: url)
        
        self.request(apiRequest) { result in
            completion(result)
        }
    }
}

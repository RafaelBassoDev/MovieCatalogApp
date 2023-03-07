import Foundation

public struct APIHandler {
    
    private let session: APISession
    
    public init(session: APISession = URLSession.shared) {
        self.session = session
    }
    
    public func request(_ apiRequest: APIRequest?, completion: @escaping (Result<(Data?, URLResponse?), Error>) -> Void) {
        
        guard let apiRequest else {
            completion(.failure(APIError.badURL))
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
}

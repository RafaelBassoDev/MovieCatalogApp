import Foundation

public struct APIHandler {
    
    private let endpoint: String
    private let session: APISession
    
    public init(endpoint: String, session: APISession = URLSession.shared) {
        self.endpoint = endpoint
        self.session = session
    }
    
    public func callAPI(arguments: String = "", completion: @escaping (Result<(Data?, URLResponse?), Error>) -> Void ) {
        
        let URLString = self.endpoint + arguments
        
        let url = URL(string: URLString)
        
        do {
            let apiRequest = try APIRequestFacade(url: url)
            
            session.sendRequest(apiRequest.getURLRequest()) { data, response, error in
                
                if let error {
                    completion(.failure(error))
                    return
                }
                
                if let data, let response {
                    completion(.success((data, response)))
                }
            }
            
        } catch {
            completion(.failure(error))
        }
    }
}

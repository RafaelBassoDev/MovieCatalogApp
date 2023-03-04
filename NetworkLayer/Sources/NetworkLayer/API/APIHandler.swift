import Foundation

public struct APIHandler {
    
    private let endpoint: String
    private let session: URLSession
    
    public init(endpoint: String, session: URLSession = URLSession.shared) {
        self.endpoint = endpoint
        self.session = session
    }
    
    public func callAPI(arguments: String = "", completion: @escaping (Result<(Data?, URLResponse?), Error>) -> Void ) {
        
        let URLString = self.endpoint + arguments
        
        let url = URL(string: URLString)
        
        do {
            let apiRequest = try APIRequest(url: url)
            
            let dataTask = self.session.dataTask(with: apiRequest.getRequest()) { data, response, error in
                if let error {
                    completion(.failure(error))
                }
                
                if let data, let response {
                    completion(.success((data, response)))
                }
            }
            
            dataTask.resume()
            
        } catch {
            completion(.failure(error))
        }
    }
}

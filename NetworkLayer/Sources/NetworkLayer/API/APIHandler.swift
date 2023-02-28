import Foundation

public struct APIHandler {
    
    private let endpoint: String
    private let dataTaskhandler: APIDataTaskManager
    
    public init(endpoint: String, session: URLSession = URLSession.shared) {
        self.endpoint = endpoint
        self.dataTaskhandler = APIDataTaskManager(session: session)
    }
    
    public func callAPI(arguments: String = "", completion: @escaping (Result<(Data?, URLResponse?), Error>) -> Void ) {
        
        let URLString = self.endpoint + arguments
        
        let url = URL(string: URLString)
        
        do {
            let apiRequest = try APIRequest(url: url)
            
            dataTaskhandler.createRequest(request: apiRequest.getRequest()) { result in
                completion(result)
            }
        } catch {
            completion(.failure(error))
        }
    }
}

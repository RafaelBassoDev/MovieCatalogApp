import Foundation

internal struct APIDataTaskManager {
    
    private weak var session: URLSession!
    
    public init(session: URLSession) {
        self.session = session
    }
    
    public func createRequest(request: URLRequest, _ completion: @escaping (Result<(Data?, URLResponse?), Error>) -> Void) {
        let dataTask = self.session.dataTask(with: request) { data, response, error in
            if let error {
                completion(.failure(error))
                return
            }
            
            completion(.success((data, response)))
        }
        
        dataTask.resume()
    }
}

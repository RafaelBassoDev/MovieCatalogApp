import Foundation

extension URLSession: APISession {
    public func sendRequest(_ request: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        let task = self.dataTask(with: request) { data, response, error in
            completion(data, response, error)
        }
        
        task.resume()
    }
}

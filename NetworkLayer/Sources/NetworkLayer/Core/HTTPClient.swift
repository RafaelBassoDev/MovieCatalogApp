import Foundation

@available(iOS 13.0.0, *)
public protocol HTTPClient {
    func sendRequest(endpoint: Endpoint) async throws -> Data
    func sendRequest<T: Decodable>(endpoint: Endpoint, decoding responseModel: T.Type) async throws -> T
}

@available(iOS 13.0.0, *)
extension HTTPClient {
    public func sendRequest(endpoint: Endpoint) async throws -> Data {
        var urlComponents = URLComponents()
        urlComponents.scheme = endpoint.scheme
        urlComponents.host = endpoint.host
        urlComponents.path = endpoint.path
        urlComponents.query = endpoint.query
        
        guard let url = urlComponents.url else {
            throw RequestError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.allHTTPHeaderFields = endpoint.header
        
        if let body = endpoint.body {
            request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        }
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let response = response as? HTTPURLResponse else {
            throw RequestError.noResponse
        }
        
        switch response.statusCode {
        case 200...299:
            return data
            
        case 401:
            throw RequestError.unauthorized
        
        default:
            throw RequestError.unknown
        }
    }
    
    public func sendRequest<T: Decodable>(endpoint: Endpoint, decoding responseModel: T.Type) async throws -> T {
        let requestData = try await sendRequest(endpoint: endpoint)
        
        guard let decodedData = JSONParser().parse(data: requestData, from: responseModel) else {
            throw RequestError.decode
        }
        
        return decodedData
    }
}

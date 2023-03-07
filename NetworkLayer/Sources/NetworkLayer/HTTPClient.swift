import Foundation

protocol HTTPClient {
    @available(iOS 13.0.0, *)
    func sendRequest<T: Decodable>(endpoint: Endpoint, responseModel: T.Type) async throws -> T
}

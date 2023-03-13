import Foundation
import NetworkLayer

struct MovieService: HTTPClient, MovieServiceable {
    func getPopular() async -> Result<PopularResponseModel, RequestError> {
        do {
            let response = try await sendRequest(endpoint: MovieEndpoint.popular, responseModel: PopularResponseModel.self)
            return .success(response)
        } catch {
            if let requestError = error as? RequestError {
                return .failure(requestError)
            }
        }
        
        return .failure(.unknown)
    }
}

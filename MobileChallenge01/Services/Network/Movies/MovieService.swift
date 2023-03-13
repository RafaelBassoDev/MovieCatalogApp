import Foundation
import NetworkLayer

struct MovieService: HTTPClient, MovieServiceable {
    func getPopular() async -> Result<PopularResponseModel, RequestError> {
        let endpoint = MovieEndpoint.popular
        let responseModel = PopularResponseModel.self
        
        return await handleRequest(endpoint: endpoint, responseModel: responseModel)
    }
    
    func getGenres() async -> Result<GenreResponseModel, RequestError> {
        let endpoint = MovieEndpoint.genres
        let responseModel = GenreResponseModel.self
        
        return await handleRequest(endpoint: endpoint, responseModel: responseModel)
    }
    
    private func handleRequest<T: Decodable>(endpoint: Endpoint, responseModel: T.Type) async -> Result<T, RequestError> {
        do {
            let response = try await sendRequest(endpoint: endpoint, responseModel: responseModel.self)
            return .success(response)
            
        } catch {
            if let requestError = error as? RequestError {
                return .failure(requestError)
            }
        }
        
        return .failure(.unknown)
    }
}

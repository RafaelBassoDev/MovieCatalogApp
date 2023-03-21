import UIKit
import NetworkLayer

struct MovieService: HTTPClient, MovieServiceable {
    func getPopular() async -> Result<PopularResponseModel, Error> {
        let endpoint = MovieEndpoint.popular
        let responseModel = PopularResponseModel.self
        return await makeRequest(endpoint: endpoint, responseModel: responseModel)
    }
    
    func getGenres() async -> Result<GenreResponseModel, Error> {
        let endpoint = MovieEndpoint.genres
        let responseModel = GenreResponseModel.self
        return await makeRequest(endpoint: endpoint, responseModel: responseModel)
    }
    

extension MovieService {
    private func makeRequest<T: Decodable>(endpoint: Endpoint, responseModel: T.Type) async -> Result<T, Error> {
        do {
            let response = try await sendRequest(endpoint: endpoint, decoding: responseModel)
            return .success(response)
            
        } catch {
            return .failure(error)
        }
    }
}

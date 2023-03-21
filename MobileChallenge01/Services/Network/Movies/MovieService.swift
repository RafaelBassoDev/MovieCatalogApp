import UIKit
import NetworkLayer

enum MovieServiceError: Error {
    case badResponseData
}

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
    
    func getPoster(filePath: String, size: PosterSize = .original) async -> Result<UIImage, Error> {
        let endpoint = MovieEndpoint.poster(size: size, path: filePath)
        do {
            let responseData = try await sendRequest(endpoint: endpoint)
            guard let posterImage = UIImage(data: responseData) else {
                return .failure(MovieServiceError.badResponseData)
            }
            return .success(posterImage)
            
        } catch {
            return .failure(error)
        }
    }
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

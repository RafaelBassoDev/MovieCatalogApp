import Foundation
import NetworkLayer

protocol MovieServiceable {
    func getPopular() async -> Result<PopularResponseModel, RequestError>
    func getGenres() async -> Result<GenreResponseModel, RequestError>
}

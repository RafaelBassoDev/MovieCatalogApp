import UIKit
import NetworkLayer

protocol MovieServiceable {
    func getPopular() async -> Result<PopularResponseModel, Error>
    func getGenres() async -> Result<GenreResponseModel, Error>
    func getPoster(filePath: String, size: PosterSize) async -> Result<UIImage, Error>
}

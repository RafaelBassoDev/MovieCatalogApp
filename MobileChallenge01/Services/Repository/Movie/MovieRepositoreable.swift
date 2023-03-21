import UIKit

protocol MovieRepositoreable {
    func getPopularMovies() async -> Result<[Movie], Error>
    func getMoviePoster(for movie: Movie, size: PosterSize) async -> UIImage?
}

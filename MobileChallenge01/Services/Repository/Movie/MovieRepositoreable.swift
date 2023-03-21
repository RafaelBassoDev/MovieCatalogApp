import UIKit

protocol MovieRepositoreable {
    func getPopularMovies() async -> Result<[Movie], Error>
    func getMoviePoster(movie: Movie, size: PosterSize) async -> UIImage?
}

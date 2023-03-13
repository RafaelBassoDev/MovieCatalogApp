import Foundation

protocol MovieRepositoreable {
    func getPopularMovies() async -> Result<[Movie], Error>
}

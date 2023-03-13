import Foundation

protocol MovieRepositoreable {
    func getPopularMovies() async -> Result<[Movie], Error>
    func getGenres() async -> Result<[String], Error>
}

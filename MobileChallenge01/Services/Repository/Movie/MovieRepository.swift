import Foundation

struct MovieRepository: MovieRepositoreable {
    typealias DataType = Movie
    
    func getPopularMovies() async -> Result<[Movie], Error> {
        return .success([])
    }
    
    func getGenres() async -> Result<[String], Error> {
        return .success([])
    }
}

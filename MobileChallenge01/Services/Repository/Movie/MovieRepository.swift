import UIKit

struct MovieRepository: MovieRepositoreable {
    typealias DataType = Movie
    
    private let service: MovieServiceable
    
    init(service: MovieServiceable) {
        self.service = service
    }
    
    func getPopularMovies() async -> Result<[Movie], Error> {
        
        let response = await service.getPopular()
        let genres = await getGenres()
        
        switch response {
        case .success(let popularMovies):
            let movies = translateDomainMovies(from: popularMovies.results, genres: genres)
            return .success(movies)
            
        case .failure(let error):
            return .failure(error)
        }
    }
    
    func getMoviePoster(for movie: Movie, size: PosterSize) async -> UIImage? {
        guard let posterPath = movie.posterPath else {
            return nil
        }
        
        let response = await service.getPoster(filePath: posterPath, size: size)
        
        switch response {
        case .success(let poster):
            return poster
            
        case .failure:
            return nil
        }
    }
}

extension MovieRepository {
    
    private func getGenres() async -> [Genre] {
        let response = await service.getGenres()
        
        switch response {
        case .success(let model):
            return model.genres
            
        case .failure:
            return []
        }
    }
    
    private func translateDomainMovies(from serviceMovies: [MovieResponseModel], genres: [Genre]) -> [Movie] {
        
        var domainMovies = [Movie]()
        
        for serviceMovie in serviceMovies {
            
            let associatedGenres = genres.filter { serviceMovie.genreIDS.contains($0.id) }
            
            let movie = Movie(
                id: serviceMovie.id,
                poster: nil,
                posterPath: serviceMovie.posterPath,
                title: serviceMovie.title,
                overview: serviceMovie.overview,
                releaseDate: serviceMovie.releaseDate,
                popularity: serviceMovie.popularity,
                genres: associatedGenres.map { $0.name }
            )
            
            domainMovies.append(movie)
        }
        
        return domainMovies
    }
}

//
//  MovieListViewModel.swift
//  MobileChallenge01
//
//  Created by Rafael Basso on 07/02/23.
//

import UIKit

class MovieListViewModel {
    
    private var movieList: MovieList
    private var repository: MovieRepositoreable
    
    init(movies: [Movie] = [], repository: MovieRepositoreable) {
        self.movieList = MovieList(movies)
        self.repository = repository
    }
    
    /// Updates model with the latest API popular movies.
    ///
    /// - Parameters:
    ///   - completion: completion handler indicating the function has finished.
    func getPopularMovies() async {
        let result = await repository.getPopularMovies()
        
        switch result {
        case .success(let movies):
            movieList.createNewList(from: movies)
            
        case .failure:
            break
        }
    }
    
    func getPosterForAllMovies() async {
        _ = await withTaskGroup(of: UIImage?.self) { taskGroup in
            for movie in movieList.allMovies {
                taskGroup.addTask {
                    guard let poster = await self.repository.getMoviePoster(for: movie, size: .w300) else {
                        return nil
                    }
                    movie.poster = poster
                    return poster
                }
            }
        }
    }
    
    /// Updates model with movie titles that contain given string.
    ///
    /// - Parameters:
    ///   - inputStream: string to search on API.
    ///   - completion: completion handler indicating the function has finished.
    func searchForTitles(containing inputStream: String, _ completion: @escaping () -> Void) {
        completion()
    }
}

extension MovieListViewModel {
    
    func getMovieCount() -> Int {
        return movieList.count
    }
    
    func getMovieData(for indexPath: IndexPath) -> Movie? {
        return movieList[indexPath.row]
    }
}

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
    func getPopularMovies(_ completion: @escaping (Result<[Movie], Error>) -> Void) {
        Task(priority: .high) {
            let result = await repository.getPopularMovies()
            completion(result)
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
    
    func updateMovieList(with movies: [Movie]) {
        self.movieList = MovieList(movies)
    }
    
    func getMovieCount() -> Int {
        return movieList.count
    }
    
    func getMovieData(for indexPath: IndexPath) -> Movie? {
        return movieList[indexPath.row]
    }
}

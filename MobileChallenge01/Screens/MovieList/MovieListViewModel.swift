//
//  MovieListViewModel.swift
//  MobileChallenge01
//
//  Created by Rafael Basso on 07/02/23.
//

import UIKit

struct MovieListViewModel {
    
    var model: MovieList?
    
    /// Updates model with the latest API popular movies.
    ///
    /// - Parameters:
    ///   - completion: completion handler indicating the function has finished.
    mutating func refreshListWithPopularMovies(_ completion: @escaping () -> Void) { // Adicionar error e message response da API
        self.model = MovieList(
            Movie(poster: nil, title: "Narnia", overview: "", releaseDate: "1998", popularity: 8.7, genres: []),
            Movie(poster: nil, title: "Avatar 2", overview: "", releaseDate: "2022", popularity: 8.7, genres: []),
            Movie(poster: nil, title: "Onde os fracos não tem vez", overview: "", releaseDate: "2003", popularity: 8.7, genres: [])
        )
        
        completion()
    }
    
    /// Updates model with movie titles that contain given string.
    ///
    /// - Parameters:
    ///   - inputStream: string to search on API.
    ///   - completion: completion handler indicating the function has finished.
    mutating func searchForTitles(containing inputStream: String, _ completion: @escaping () -> Void) {
        self.model = MovieList(
            Movie(poster: nil, title: "Avatar 2", overview: "", releaseDate: "2022", popularity: 8.7, genres: []),
            Movie(poster: nil, title: "Narnia", overview: "", releaseDate: "2015", popularity: 8.7, genres: [])
        )

        completion()
    }
    
    func getMovieCount() -> Int {
        guard let movieArray = model?.movies else {
            return 0
        }
        
        return movieArray.count
    }
    
    func getMovieData(for indexPath: IndexPath) -> Movie? {
        guard let movieDetail = model?.movies[indexPath.row] else {
            return nil
        }
        
        return movieDetail
    }
}

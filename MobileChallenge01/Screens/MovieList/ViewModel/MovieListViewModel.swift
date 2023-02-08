//
//  MovieListViewModel.swift
//  MobileChallenge01
//
//  Created by Rafael Basso on 07/02/23.
//

import UIKit

class MovieListViewModel {
    
    var model: MovieList?
    
    /// Updates model with the latest API popular movies.
    ///
    /// - Parameters:
    ///   - completion: completion handler indicating the function has finished.
    func refreshListWithPopularMovies(_ completion: @escaping () -> Void) { // Adicionar error e message response da API
        self.model = MovieList(
            results: [
                Movie(poster_path: "", title: "Narnia", release_date: "1998"),
                Movie(poster_path: "", title: "Avatar 2", release_date: "2023"),
                Movie(poster_path: "", title: "Onde os fracos não tem vez", release_date: "2003")
            ]
        )
        completion()
    }
    
    /// Updates model with movie titles that contain given string.
    ///
    /// - Parameters:
    ///   - inputStream: string to search on API.
    ///   - completion: completion handler indicating the function has finished.
    func searchForTitles(containing inputStream: String, _ completion: @escaping () -> Void) {
        self.model = MovieList(
            results: [
                Movie(poster_path: "", title: "Jumanji", release_date: "2001"),
                Movie(poster_path: "", title: "Expresso do amanha", release_date: "2006")
            ]
        )
        completion()
    }
    
    func getImageFor(path: String?) -> UIImage? {
        // get image from API
        return UIImage(named: "no-image-placeholder")
    }
    
}

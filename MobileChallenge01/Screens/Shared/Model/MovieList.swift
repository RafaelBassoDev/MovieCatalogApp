//
//  MovieList.swift
//  MobileChallenge01
//
//  Created by Rafael Basso on 07/02/23.
//

import Foundation

struct MovieList {
    private let movies: [Movie]
    
    init(_ movies: [Movie]) {
        self.movies = movies
    }
}

extension MovieList {
    subscript(index: Int) -> Movie? {
        if index < 0 { return nil }
        if index > (count - 1) { return nil }
        
        return self.movies[index]
    }
}

extension MovieList {
    var count: Int {
        movies.count
    }
    
    var allMovies: [Movie] {
        movies
    }
}

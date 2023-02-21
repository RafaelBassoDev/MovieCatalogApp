//
//  MovieList.swift
//  MobileChallenge01
//
//  Created by Rafael Basso on 07/02/23.
//

import Foundation

struct MovieList {
    let movies: [Movie]
    
    init(_ movieList: Movie...) {
        self.movies = movieList.map { $0 }
    }
}

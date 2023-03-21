//
//  Movie.swift
//  MobileChallenge01
//
//  Created by Rafael Basso on 07/02/23.
//

import UIKit.UIImage

class Movie {
    let id: Int
    var poster: UIImage?
    let posterPath: String?
    let title: String
    let overview: String
    let releaseDate: String
    let popularity: Double
    let genres: [String]
    
    init(id: Int, poster: UIImage? = nil, posterPath: String?, title: String, overview: String, releaseDate: String, popularity: Double, genres: [String]) {
        self.id = id
        self.poster = poster
        self.posterPath = posterPath
        self.title = title
        self.overview = overview
        self.releaseDate = releaseDate
        self.popularity = popularity
        self.genres = genres
    }
}

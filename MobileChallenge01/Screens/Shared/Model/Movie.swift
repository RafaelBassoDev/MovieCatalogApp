//
//  Movie.swift
//  MobileChallenge01
//
//  Created by Rafael Basso on 07/02/23.
//

import UIKit.UIImage

struct Movie {
    let poster: UIImage?
    let posterPath: String?
    let title: String
    let overview: String
    let releaseDate: String
    let popularity: Double
    let genres: [String]
}

//
//  MovieDetailViewModel.swift
//  MobileChallenge01
//
//  Created by Rafael Basso on 21/02/23.
//

import UIKit.UIImage

struct MovieDetailViewModel {
    
    private let IMAGE_PLACEHOLDER_NAME = "no-image-placeholder"
    
    private var model: Movie
    
    init(model: Movie) {
        self.model = model
    }
    
    func getPoster() -> UIImage? {
        guard let poster = model.poster else {
            return UIImage(named: IMAGE_PLACEHOLDER_NAME)
        }
        return poster
    }
    
    func getMovieTitle() -> String {
        model.title
    }
    
    func getGenres() -> String {
        model.genres.joined(separator: " | ")
    }
    
    func getSynopsis() -> String {
        model.overview
    }
    
    func getRating() -> String {
        String(format: "%.1f", model.popularity) + " / 10"
    }
}

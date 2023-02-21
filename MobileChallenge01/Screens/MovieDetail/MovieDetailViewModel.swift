//
//  MovieDetailViewModel.swift
//  MobileChallenge01
//
//  Created by Rafael Basso on 21/02/23.
//

import Foundation

struct MovieDetailViewModel {
    
    private var model: Movie
    
    init(model: Movie) {
        self.model = model
    }
    
    func getMovieTitle() -> String {
        model.title
    }
}

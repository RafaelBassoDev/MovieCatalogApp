//
//  MovieDetailViewModelTests.swift
//  MobileChallenge01Tests
//
//  Created by Rafael Basso on 21/02/23.
//

import XCTest
@testable import MobileChallenge01

final class MovieDetailViewModelTests: XCTestCase {

    var sut: MovieDetailViewModel!
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func testGetTitle() throws {
        let model = Movie(
            poster: nil,
            title: "Avatar",
            overview: "",
            releaseDate: "",
            popularity: 7,
            genres: []
        )
        
        sut = MovieDetailViewModel(model: model)
        
        XCTAssertEqual(sut.getMovieTitle(), model.title)
    }
}

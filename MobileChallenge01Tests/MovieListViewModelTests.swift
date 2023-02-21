//
//  MovieListViewModelTests.swift
//  MobileChallenge01Tests
//
//  Created by Rafael Basso on 21/02/23.
//

import XCTest
@testable import MobileChallenge01

final class MovieListViewModelTests: XCTestCase {

    var sut: MovieListViewModel!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = MovieListViewModel()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func testRefreshWithPopularMovies() throws {
        let expectation = XCTestExpectation(description: "Call API to get popular movies.")
        
        sut.refreshListWithPopularMovies {
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
    
}

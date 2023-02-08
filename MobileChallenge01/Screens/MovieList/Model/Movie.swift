//
//  Movie.swift
//  MobileChallenge01
//
//  Created by Rafael Basso on 07/02/23.
//

import UIKit.UIImage

struct Movie: Decodable {
    let poster_path: String?
    let title: String?
    let release_date: String?
}

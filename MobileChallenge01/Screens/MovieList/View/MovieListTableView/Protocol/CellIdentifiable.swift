//
//  CellIdentifiable.swift
//  MobileChallenge01
//
//  Created by Rafael Basso on 17/02/23.
//

protocol CellIdentifiable: AnyObject {
    static var reuseIdentifier: String { get }
}

//
//  MovieListTableView.swift
//  MobileChallenge01
//
//  Created by Rafael Basso on 08/02/23.
//

import UIKit

class MovieListTableView: UITableView {
    
    var constraintDelegate: UITableViewConstraintDelegate?
    
    init() {
        super.init(frame: CGRect(), style: .plain)
        
        register(MovieListTableViewCell.self, forCellReuseIdentifier: MovieListTableViewCell.reuseIdentifier)
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        constraintDelegate?.didAddToSuperview()
    }
}

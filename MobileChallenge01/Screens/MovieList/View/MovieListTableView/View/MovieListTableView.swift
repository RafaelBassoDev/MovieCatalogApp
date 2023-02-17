//
//  MovieListTableView.swift
//  MobileChallenge01
//
//  Created by Rafael Basso on 08/02/23.
//

import UIKit

class MovieListTableView<Cell: UITableViewCell>: UITableView where Cell: CellIdentifiable {
    
    var constraintDelegate: UITableViewConstraintDelegate?
    
    init() {
        super.init(frame: CGRect(), style: .plain)
        
        register(Cell.self, forCellReuseIdentifier: Cell.reuseIdentifier)
        
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

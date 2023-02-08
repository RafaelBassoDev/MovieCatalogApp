//
//  MovieListTableViewController.swift
//  MobileChallenge01
//
//  Created by Rafael Basso on 08/02/23.
//

import UIKit

class MovieListTableViewController {
    
    var view: MovieListTableView
    
    init(_ controller: MovieListViewController) {
        view = MovieListTableView()
        
        view.delegate = controller
        view.dataSource = controller
        
        view.constraintDelegate = self
    }
    
    func reloadData() {
        self.view.reloadData()
    }
    
    func setConstraints(using view: UIView) {
        NSLayoutConstraint.activate([
            self.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            self.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            self.view.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            self.view.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}

extension MovieListTableViewController: UITableViewConstraintDelegate {
    func didAddToSuperview() {
        guard let superView = view.superview else {
            return
        }
        
        self.setConstraints(using: superView)
    }
}

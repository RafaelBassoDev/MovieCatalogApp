//
//  MovieDetailViewController.swift
//  MobileChallenge01
//
//  Created by Rafael Basso on 21/02/23.
//

import UIKit

class MovieDetailViewController: UIViewController {
    weak var coordinator: Coordinator?
    
    let viewModel: MovieDetailViewModel!
    
    let titleUILabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init(viewModel: MovieDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
        NSLayoutConstraint.activate([
            titleUILabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleUILabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        self.viewModel = nil
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        titleUILabel.text = viewModel.getMovieTitle()
        
        view.addSubview(titleUILabel)
    }
}

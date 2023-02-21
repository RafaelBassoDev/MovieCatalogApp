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
    
    init(viewModel: MovieDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.viewModel = nil
        super.init(coder: coder)
    }
}

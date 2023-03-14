//
//  Coordinator.swift
//  MobileChallenge01
//
//  Created by Rafael Basso on 06/02/23.
//

import UIKit

final class Coordinator {
    var children = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let repository = MovieRepository(service: MovieService())
        
        let viewModel = MovieListViewModel(repository: repository)
        
        let viewController = MovieListViewController(viewModel: viewModel)
        
        viewController.coordinator = self
        
        viewController.title = "Popular Movies"
        
        viewController.modalPresentationStyle = .fullScreen
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func showDetails(of movie: Movie) {
        let viewModel = MovieDetailViewModel(model: movie)
        
        let viewController = MovieDetailViewController(viewModel: viewModel)
        
        viewController.coordinator = self
        
        viewController.modalPresentationStyle = .fullScreen
        
        navigationController.pushViewController(viewController, animated: true)
    }
}

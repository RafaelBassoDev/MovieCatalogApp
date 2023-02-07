//
//  Coordinator.swift
//  MobileChallenge01
//
//  Created by Rafael Basso on 06/02/23.
//

import UIKit

protocol Coordinator {
    var children: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}

final class MainCoordinator: Coordinator {
    var children = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = MovieListViewController()
        
        viewController.coordinator = self
        
        viewController.modalPresentationStyle = .fullScreen
        
        navigationController.pushViewController(viewController, animated: true)
    }
}

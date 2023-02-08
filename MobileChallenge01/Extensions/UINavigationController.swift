//
//  UINavigationController.swift
//  MobileChallenge01
//
//  Created by Rafael Basso on 08/02/23.
//

import UIKit.UINavigationController
import UIKit.UINavigationBar

extension UINavigationController {
    func setCustomAppearance() {
        navigationBar.setCustomCompactAppearance()
        navigationBar.setCustomScrollEdgeAppearance()
    }
}

extension UINavigationBar {
    func setCustomCompactAppearance() {
        let defaultAppearance = UINavigationBarAppearance()
        
        defaultAppearance.configureWithTransparentBackground()
        defaultAppearance.backgroundColor = .systemGray6
        defaultAppearance.titleTextAttributes = [
            .foregroundColor: UIColor.black,
            .font: UIFont.systemFont(ofSize: 22, weight: .bold)
        ]
        
        self.standardAppearance = defaultAppearance
        self.compactAppearance = defaultAppearance
    }
    
    func setCustomScrollEdgeAppearance() {
        let scrollAppearance = UINavigationBarAppearance()
        
        scrollAppearance.configureWithOpaqueBackground()
        scrollAppearance.backgroundColor = .white
        scrollAppearance.titleTextAttributes = [
            .foregroundColor: UIColor.black,
            .font: UIFont.systemFont(ofSize: 22, weight: .bold)
        ]
        
        self.scrollEdgeAppearance = scrollAppearance
    }
}

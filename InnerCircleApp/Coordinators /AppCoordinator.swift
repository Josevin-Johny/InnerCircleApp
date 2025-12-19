//
//  AppCoordinator.swift
//  InnerCircleApp
//
//  Created by Josevin Johny on 19/12/2025.
//

import UIKit

class AppCoordinator: Coordinator {
    var navigationController: UINavigationController
    var coordinators: [Coordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        showLogin()
    }
    
    func showLogin() {
        let loginCoordinator = LoginCoordinator(navigationController: navigationController)
        loginCoordinator.parentCoordinator = self
        coordinate(to: loginCoordinator)
    }
    
    func showOnboarding() {
        print("TODO: Show Onboarding")
        // Will implement next
    }
    
    func showHome() {
        let homeVC = HomeViewController()
        navigationController.pushViewController(homeVC, animated: true)
        coordinators.removeAll()
    }
}

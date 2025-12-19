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
    private var logoutObserver: NSObjectProtocol?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        registerLogoutObserver()
        showLogin()
    }
    
    func showLogin() {
        let loginCoordinator = LoginCoordinator(navigationController: navigationController)
        loginCoordinator.parentCoordinator = self
        coordinate(to: loginCoordinator)
    }
    
    func showOnboarding() {
        let onboardingCoordinator = OnboardingCoordinator(navigationController: navigationController)
        onboardingCoordinator.parentCoordinator = self
        coordinators.removeAll { $0 is OnboardingCoordinator }
        coordinate(to: onboardingCoordinator)
    }
    
    func showHome() {
        let homeVC = HomeViewController()
        navigationController.setViewControllers([homeVC], animated: true)
        coordinators.removeAll()
    }

    private func registerLogoutObserver() {
        logoutObserver = NotificationCenter.default.addObserver(
            forName: Notification.Name("ICLogoutNotification"),
            object: nil,
            queue: .main
        ) { [weak self] _ in
            self?.showLogin()
        }
    }
    
    deinit {
        if let logoutObserver = logoutObserver {
            NotificationCenter.default.removeObserver(logoutObserver)
        }
    }
}

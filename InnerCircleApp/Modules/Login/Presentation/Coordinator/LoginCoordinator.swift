//
//  LoginCoordinator.swift
//  InnerCircleApp
//
//  Created by Josevin Johny on 19/12/2025.
//

import UIKit
import Combine

class LoginCoordinator: Coordinator {
    var navigationController: UINavigationController
    var coordinators: [Coordinator] = []
    
    weak var parentCoordinator: AppCoordinator?
    private var cancellables = Set<AnyCancellable>()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let dataSource = FakeAuthDataSource()
        let repository = AuthRepository(dataSource: dataSource)
        let useCase = LoginUseCase(authRepository: repository)
        let viewModel = LoginViewModel(loginUseCase: useCase)
        
        viewModel.loginSuccess
            .sink { [weak self] userType in
                self?.handleLoginSuccess(userType: userType)
            }
            .store(in: &cancellables)
        
        viewModel.skipToOnboarding
            .sink { [weak self] in
                self?.handleSkipToOnboarding()
            }
            .store(in: &cancellables)
        
        let loginVC = LoginViewController(viewModel: viewModel)
        navigationController.setViewControllers([loginVC], animated: false)
    }
    
    private func handleLoginSuccess(userType: User.UserType) {
        switch userType {
        case .newUser:
            parentCoordinator?.showOnboarding()
        case .approvedUser:
            parentCoordinator?.showHome()
        }
    }
    
    private func handleSkipToOnboarding() {
        parentCoordinator?.showOnboarding()
    }
}

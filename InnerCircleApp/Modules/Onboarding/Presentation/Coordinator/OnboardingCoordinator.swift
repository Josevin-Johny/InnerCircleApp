//
//  OnboardingCoordinator.swift
//  InnerCircleApp
//
//  Created by Josevin Johny on 19/12/2025.
//

import UIKit
import SwiftUI
import Combine

class OnboardingCoordinator: Coordinator {
    var navigationController: UINavigationController
    var coordinators: [Coordinator] = []
    
    weak var parentCoordinator: AppCoordinator?
    private var cancellables = Set<AnyCancellable>()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = OnboardingViewModel()
        
        // Subscribe to completion event
        viewModel.onboardingComplete
            .sink { [weak self] in
                self?.handleOnboardingComplete()
            }
            .store(in: &cancellables)
        
        // Create SwiftUI view
        let onboardingView = OnboardingContainerView(viewModel: viewModel)
        
        // Wrap in UIHostingController ← KEY: UIKit → SwiftUI
        let hostingController = UIHostingController(rootView: onboardingView)
        hostingController.title = "Onboarding"
        
        hostingController.navigationItem.hidesBackButton = true
        // Push onto UIKit navigation stack
        navigationController.pushViewController(hostingController, animated: true)
    }
    
    private func handleOnboardingComplete() {
        parentCoordinator?.showHome()
    }
}

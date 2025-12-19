//
//  OnboardingContainerView.swift
//  InnerCircleApp
//
//  Created by Josevin Johny on 19/12/2025.
//

import SwiftUI

struct OnboardingContainerView: View {
    @StateObject var viewModel: OnboardingViewModel
    
    var body: some View {
        VStack {
            switch viewModel.currentStep {
            case 0:
                IntroView(viewModel: viewModel)
            case 1:
                NameView(viewModel: viewModel)
            case 2:
                LifestylesView(viewModel: viewModel)
            case 3:
                ConfirmationView(viewModel: viewModel)
            default:
                Text("Complete!")
            }
        }
    }
}

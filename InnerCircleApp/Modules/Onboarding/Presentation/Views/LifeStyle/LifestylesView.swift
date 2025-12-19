//
//  LifestylesView.swift
//  InnerCircleApp
//
//  Created by Josevin Johny on 19/12/2025.
//

import SwiftUI

struct LifestylesView: View {
    @ObservedObject var viewModel: OnboardingViewModel
    
    var body: some View {
        LifestylesRepresentable { selectedLifestyles in
            viewModel.updateLifestyles(selectedLifestyles)
            viewModel.nextStep()
        }
        .edgesIgnoringSafeArea(.all)
    }
}

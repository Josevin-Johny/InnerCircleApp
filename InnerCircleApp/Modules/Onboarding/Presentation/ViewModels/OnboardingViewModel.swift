//
//  OnboardingViewModel.swift
//  InnerCircleApp
//
//  Created by Josevin Johny on 19/12/2025.
//

import Foundation
import Combine

class OnboardingViewModel: ObservableObject {
    @Published var currentStep: Int = 0
    @Published var onboardingData = OnboardingData()
    
    let onboardingComplete = PassthroughSubject<Void, Never>()
    
    func nextStep() {
        currentStep += 1
    }
    
    func updateName(_ name: String) {
        onboardingData.name = name
    }
    
    func updateLifestyles(_ lifestyles: [String]) {
        onboardingData.selectedLifestyles = lifestyles
    }
    
    func completeOnboarding() {
        onboardingData.isCompleted = true
        onboardingComplete.send()
    }
}

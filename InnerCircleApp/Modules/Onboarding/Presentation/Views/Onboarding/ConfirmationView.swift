//
//  ConfirmationView.swift
//  InnerCircleApp
//
//  Created by Josevin Johny on 19/12/2025.
//

import SwiftUI

struct ConfirmationView: View {
    @ObservedObject var viewModel: OnboardingViewModel
    
    var body: some View {
        VStack(spacing: 30) {
            Spacer()
            
            Text("All Set, \(viewModel.onboardingData.name)!")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            VStack(alignment: .leading, spacing: 12) {
                Text("Your Lifestyles:")
                    .font(.headline)
                
                ForEach(viewModel.onboardingData.selectedLifestyles, id: \.self) { lifestyle in
                    Text(lifestyle)
                        .font(.subheadline.weight(.semibold))
                        .foregroundColor(.white)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 14)
                        .background(Color.blue)
                        .cornerRadius(16)
                }
            }
            .padding()
            
            Spacer()
            
            Button(action: {
                viewModel.completeOnboarding()
            }) {
                Text("Complete")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 40)
        }
    }
}

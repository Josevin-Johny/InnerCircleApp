//
//  IntroView.swift
//  InnerCircleApp
//
//  Created by Josevin Johny on 19/12/2025.
//

import SwiftUI

struct IntroView: View {
    @ObservedObject var viewModel: OnboardingViewModel
    
    var body: some View {
        VStack(spacing: 30) {
            Spacer()
            
            Text("Welcome to Inner Circle")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Let's get you set up")
                .font(.title3)
                .foregroundColor(.secondary)
            
            Spacer()
            
            Button(action: {
                viewModel.nextStep()
            }) {
                Text("Get Started")
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

//
//  NameView.swift
//  InnerCircleApp
//
//  Created by Josevin Johny on 19/12/2025.
//

import SwiftUI

struct NameView: View {
    @ObservedObject var viewModel: OnboardingViewModel
    @State private var name: String = ""
    
    var body: some View {
        VStack(spacing: 30) {
            Spacer()
            
            Text("What's your name?")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            TextField("Enter your name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 20)
                .frame(height: 50)
            
            Spacer()
            
            Button(action: {
                viewModel.updateName(name)
                viewModel.nextStep()
            }) {
                Text("Continue")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(name.isEmpty ? Color.gray : Color.blue)
                    .cornerRadius(10)
            }
            .disabled(name.isEmpty)
            .padding(.horizontal, 20)
            .padding(.bottom, 40)
        }
    }
}

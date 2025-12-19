//
//  LoginViewModel.swift
//  InnerCircleApp
//
//  Created by Josevin Johny on 19/12/2025.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    // Inputs
    @Published var email: String = ""
    @Published var password: String = ""
    
    // Outputs
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    // Events
    let loginSuccess = PassthroughSubject<User.UserType, Never>()
    let skipToOnboarding = PassthroughSubject<Void, Never>()
    
    private let loginUseCase: LoginUseCaseProtocol
    private var cancellables = Set<AnyCancellable>()
    
    init(loginUseCase: LoginUseCaseProtocol) {
        self.loginUseCase = loginUseCase
    }
    
    func login() {
        isLoading = true
        errorMessage = nil
        
        Task {
            do {
                let user = try await loginUseCase.execute(email: email, password: password)
                await MainActor.run {
                    self.isLoading = false
                    self.loginSuccess.send(user.userType)
                }
            } catch {
                await MainActor.run {
                    self.isLoading = false
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
    
    func continueAsNewUser() {
        skipToOnboarding.send()
    }
}

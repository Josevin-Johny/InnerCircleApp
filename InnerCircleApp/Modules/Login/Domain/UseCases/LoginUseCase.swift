//
//  LoginUseCase.swift
//  InnerCircleApp
//
//  Created by Josevin Johny on 19/12/2025.
//

import Foundation

protocol LoginUseCaseProtocol {
    func execute(email: String, password: String) async throws -> User
}

class LoginUseCase: LoginUseCaseProtocol {
    private let authRepository: AuthRepositoryProtocol
    
    init(authRepository: AuthRepositoryProtocol) {
        self.authRepository = authRepository
    }
    
    func execute(email: String, password: String) async throws -> User {
        guard !email.isEmpty else {
            throw NSError(domain: "LoginError", code: 1, userInfo: [NSLocalizedDescriptionKey: "Email cannot be empty"])
        }
        
        return try await authRepository.login(email: email, password: password)
    }
}

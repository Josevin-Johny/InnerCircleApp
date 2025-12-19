//
//  AuthRepository.swift
//  InnerCircleApp
//
//  Created by Josevin Johny on 19/12/2025.
//

import Foundation

class AuthRepository: AuthRepositoryProtocol {
    private let dataSource: AuthDataSourceProtocol
    
    init(dataSource: AuthDataSourceProtocol) {
        self.dataSource = dataSource
    }
    
    func login(email: String, password: String) async throws -> User {
        return try await dataSource.login(email: email, password: password)
    }
}

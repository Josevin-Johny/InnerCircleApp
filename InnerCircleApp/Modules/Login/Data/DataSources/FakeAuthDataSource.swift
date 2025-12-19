//
//  FakeAuthDataSource.swift
//  InnerCircleApp
//
//  Created by Josevin Johny on 19/12/2025.
//

import Foundation

protocol AuthDataSourceProtocol {
    func login(email: String, password: String) async throws -> User
}

class FakeAuthDataSource: AuthDataSourceProtocol {
    func login(email: String, password: String) async throws -> User {
        // Simulate network delay
        try await Task.sleep(nanoseconds: 200_000_000) // 0.5 seconds
        
        // Logic: if email contains "new" → new user, else approved
        let userType: User.UserType = email.lowercased().contains("new") ? .newUser : .approvedUser
        let user = User(id: UUID().uuidString, email: email, userType: userType)
        
        return user
    }
}

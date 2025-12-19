//
//  AuthRepositoryProtocol.swift
//  InnerCircleApp
//
//  Created by Josevin Johny on 19/12/2025.
//

import Foundation

protocol AuthRepositoryProtocol {
    func login(email: String, password: String) async throws -> User
}

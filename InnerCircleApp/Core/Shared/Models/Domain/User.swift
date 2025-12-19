//
//  User.swift
//  InnerCircleApp
//
//  Created by Josevin Johny on 19/12/2025.
//

struct User {
    let id: String
    let email: String
    let userType: UserType
        
    enum UserType {
        case newUser
        case approvedUser
    }
}

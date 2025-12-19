//
//  LoginView.swift
//  InnerCircleApp
//
//  Created by Josevin Johny on 19/12/2025.
//
import UIKit

final class LoginView: UIView {
    
    let emailTextField = CustomTextField(placeholder: "Email", keyboardType: .emailAddress)
    let passwordTextField = CustomTextField(placeholder: "Password", isSecure: true)
    let loginButton = PrimaryButton(title: "Login")
    
    let newUserButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Continue as New User", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .medium)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError(" Not Initialzed")
    }
    
    private func setupUI() {
        backgroundColor = .systemBackground
        
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
        addSubview(newUserButton)
        addSubview(activityIndicator)
        
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 100),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 16),
            passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 24),
            loginButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            loginButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            newUserButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 16),
            newUserButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}

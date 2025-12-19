//
//  LoginViewController.swift
//  InnerCircleApp
//
//  Created by Josevin Johny on 19/12/2025.
//

import UIKit
import Combine

final class LoginViewController: UIViewController {
    
    private let loginView = LoginView()
    private let viewModel: LoginViewModel
    private var cancellables = Set<AnyCancellable>()
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Init has not been implemented")
    }
    
    override func loadView() {
        view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
        setupActions()
        bindViewModel()
    }
    
    private func setupActions() {
        loginView.loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        loginView.newUserButton.addTarget(self, action: #selector(newUserTapped), for: .touchUpInside)
    }
    
    private func bindViewModel() {
        loginView.emailTextField.textPublisher
            .assign(to: \.email, on: viewModel)
            .store(in: &cancellables)
        
        loginView.passwordTextField.textPublisher
            .assign(to: \.password, on: viewModel)
            .store(in: &cancellables)
        
        viewModel.$isLoading
            .receive(on: DispatchQueue.main)
            .sink { [weak self] isLoading in
                self?.updateLoadingState(isLoading)
            }
            .store(in: &cancellables)
        
        viewModel.$errorMessage
            .receive(on: DispatchQueue.main)
            .sink { [weak self] error in
                if let error = error {
                    self?.showError(error)
                }
            }
            .store(in: &cancellables)
    }
    
    @objc private func loginTapped() {
        viewModel.login()
    }
    
    @objc private func newUserTapped() {
        viewModel.continueAsNewUser()
    }
    
    private func updateLoadingState(_ isLoading: Bool) {
        if isLoading {
            loginView.activityIndicator.startAnimating()
            loginView.loginButton.isEnabled = false
        } else {
            loginView.activityIndicator.stopAnimating()
            loginView.loginButton.isEnabled = true
        }
    }
    
    private func showError(_ message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}

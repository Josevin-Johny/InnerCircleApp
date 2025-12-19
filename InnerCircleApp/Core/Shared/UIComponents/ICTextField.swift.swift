//
//  ICTextField.swift.swift
//  InnerCircleApp
//
//  Created by Josevin Johny on 19/12/2025.
//

import UIKit

final class CustomTextField: UITextField {
    
    init(placeholder: String, isSecure: Bool = false, keyboardType: UIKeyboardType = .default) {
        super.init(frame: .zero)
        self.placeholder = placeholder
        self.isSecureTextEntry = isSecure
        self.keyboardType = keyboardType
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        borderStyle = .roundedRect
        autocapitalizationType = .none
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}

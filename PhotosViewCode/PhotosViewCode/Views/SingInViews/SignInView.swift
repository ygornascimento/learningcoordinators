//
//  SignInView.swift
//  PhotosViewCode
//
//  Created by Ygor Nascimento on 08/10/20.
//

import UIKit

final class SignInView: UIView {
    
    private(set) var activityIndicatorView = UIActivityIndicatorView()
    
    private(set) var emailTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .line
        textField.text = "bartjacobs"
        
        return textField
    }()
    
    private(set) var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .line
        textField.text = "123456789"
        
        return textField
    }()
    
    private(set) var signInButton: UIButton = {
        let button = UIButton()
        button.setTitle("SignIn", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.setTitleColor(.systemBlue, for: .normal)
        
        return button
    }()
    
    private(set) var cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("Cancel", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.setTitleColor(.systemBlue, for: .normal)
        
        return button
    }()
    
    private lazy var allViewsStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [emailTextField,
                                                   passwordTextField,
                                                   signInButton,
                                                   cancelButton])
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = 20
        
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViewLayout()
    }
    
    private func setupViewLayout() {
        
        addSubview(allViewsStackView)
        allViewsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            allViewsStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            allViewsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            allViewsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24)
        ])
    }
}

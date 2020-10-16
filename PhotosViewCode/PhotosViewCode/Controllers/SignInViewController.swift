//
//  SignInViewController.swift
//  PhotosViewCode
//
//  Created by Ygor Nascimento on 07/10/20.
//

import UIKit

final class SignInViewController: UIViewController {
    
    var didSignIn: ((String) -> Void)?
    var didCancel: (() -> Void)?
    
    private let signInView = SignInView()
    
    override func loadView() {
        super.loadView()
        
        view = signInView
        setupView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
    }
    
    private func setupView() {
        signInView.signInButton.addTarget(self, action: #selector(signIn(_ :)), for: .touchUpInside)
        signInView.cancelButton.addTarget(self, action: #selector(cancel(_ :)), for: .touchUpInside)
    }
    
    @objc private func signIn(_ sender: UIButton) {
        // Hide Sign In Button
        signInView.signInButton.isHidden = true
        
        // Disable Cancel Button
        signInView.cancelButton.isEnabled = false
        
        DispatchQueue.global().async {
            sleep(2)
            
            DispatchQueue.main.async {
                // Invoke Handler
                self.didSignIn?("987654321")
            }
        }
    }
    
    @objc private func cancel(_ sender: UIButton) {
        didCancel?()
    }
}

//
//  BuyCoordinator.swift
//  PhotosViewCode
//
//  Created by Ygor Nascimento on 10/10/20.
//

import UIKit

final class BuyPhotoCoordinator {
    
    // MARK: - Private Properties
    
    private let navigationController: UINavigationController
    private let photo: Photo
    
    // MARK: - Initialization
    
    init(navigationController: UINavigationController, photo: Photo) {
        self.navigationController = navigationController
        self.photo = photo
    }
    
    func start() {
        if UserDefaults.isSignedIn {
            goToBuyPhotoViewController(photo)
        } else {
            goToSignInViewController()
        }
    }
    
    private func finish() {
        
    }
    
    // MARK: - Go To SignInViewController
    
    private func goToSignInViewController() {
        let signInViewController = SignInViewController()
        let photo = self.photo
        
        signInViewController.didSignIn = { [weak self] (token) in
            UserDefaults.token = token
            
            self?.goToBuyPhotoViewController(photo)
        }
        
        signInViewController.didCancel = { [weak self] in
            self?.finish()
        }
        
        navigationController.pushViewController(signInViewController, animated: true)
    }
    
    // MARK: - Go To BuyPhotoViewController
    
    private func goToBuyPhotoViewController(_ photo: Photo) {
        let buyPhotoViewController = BuyPhotoViewController()
        
        buyPhotoViewController.photo = photo
        
        buyPhotoViewController.didBuyPhoto = { [weak self ] _ in
            UserDefaults.buy(photo: photo)
            
            self?.finish()
        }
        
        buyPhotoViewController.didCancel = { [weak self] in
            self?.finish()
        }
        
        navigationController.pushViewController(buyPhotoViewController, animated: true)
    }
}

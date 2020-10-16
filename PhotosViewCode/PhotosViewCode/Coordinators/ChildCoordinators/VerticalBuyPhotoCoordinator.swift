//
//  VerticalBuyPhotoCoordinator.swift
//  PhotosViewCode
//
//  Created by Ygor Nascimento on 15/10/20.
//

import UIKit

final class VerticalBuyPhotoCoordinator: BaseCoordinator {
    
    private let photo: Photo
    private let presentingViewController: UIViewController
    private let navigationController:  UINavigationController
    
    init(presentingViewController: UIViewController, photo: Photo) {
        self.presentingViewController = presentingViewController
        self.photo = photo
        
        self.navigationController = UINavigationController()
        
        super.init()
        
        navigationController.delegate = self
    }
    
    override func start() {
        if UserDefaults.isSignedIn {
            goToBuyPhotoViewController(photo)
        } else {
            goToSignInViewController()
        }
        
        presentingViewController.present(navigationController, animated: true, completion: nil)
    }
    
    private func finish() {
        presentingViewController.dismiss(animated: true, completion: nil)
        didFinishFlow?(self)
    }
    
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

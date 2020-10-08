//
//  AppCoordinator.swift
//  PhotosViewCode
//
//  Created by Ygor Nascimento on 07/10/20.
//

import UIKit

final class AppCoordinator {
    
    private let navigationController = UINavigationController()
    private var isBuyingPhoto: Photo?
    
    var rootViewController: UIViewController {
        return navigationController
    }
    
    func start() {
        goToHomeViewController()
    }
    
    // MARK: - goToHomeViewController
    
    private func goToHomeViewController() {
        let homeViewController = HomeViewController()
        
        homeViewController.didSelectPhoto = { [weak self] (photo) in
            self?.goToPhotoViewController(photo)
        }
        
        homeViewController.didSignIn = { [weak self] in
            self?.goToSignInViewController()
        }
        
        navigationController.pushViewController(homeViewController, animated: true)
    }
    
    // MARK: - goToPhotoViewController
    
    private func goToPhotoViewController(_ photo: Photo) {
        let photoViewController = PhotoViewController()
        photoViewController.photo = photo
        
        photoViewController.didBuyPhoto = { [weak self] (photo) in
            self?.isBuyingPhoto = photo
            
            if UserDefaults.isSignedIn {
                self?.goToBuyViewController(photo)
            } else {
                self?.goToSignInViewController()
            }
        }
        
        navigationController.pushViewController(photoViewController, animated: true)
    }
    
    // MARK: - goToBuyViewController
    
    private func goToBuyViewController(_ photo: Photo) {
        let buyViewController = BuyViewController()
        buyViewController.photo = photo
        
        buyViewController.didCancel = { [weak self] in
            
            self?.isBuyingPhoto = nil
            
            if let viewController = self?.navigationController.viewControllers.first(where: { $0 is PhotoViewController }) {
                self?.navigationController.popToViewController(viewController, animated: true)
            } else {
                self?.navigationController.popToRootViewController(animated: true)
            }
        }
        
        buyViewController.didBuyPhoto = { [weak self] _ in
            // Reset Helper
            self?.isBuyingPhoto = nil
            
            // Update User Defaults
            UserDefaults.buy(photo: photo)
            
            if let viewController = self?.navigationController.viewControllers.first(where: { $0 is PhotoViewController }) {
                self?.navigationController.popToViewController(viewController, animated: true)
            } else {
                self?.navigationController.popToRootViewController(animated: true)
            }
        }
        
        navigationController.pushViewController(buyViewController, animated: true)
    }
    
    // MARK: - goToSignInViewController
    
    private func goToSignInViewController() {
        let signInViewController = SignInViewController()
        
        signInViewController.didSignIn = { [weak self] (token) in
            UserDefaults.token = token
            
            if let photo = self?.isBuyingPhoto {
                self?.goToBuyViewController(photo)
            } else {
                self?.navigationController.popViewController(animated: true)
            }
        }
        
        signInViewController.didCancel = { [weak self] in
            self?.navigationController.popViewController(animated: true)
        }
        
        navigationController.pushViewController(signInViewController, animated: true)
    }
}

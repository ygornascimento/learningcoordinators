//
//  BuyCoordinator.swift
//  PhotosViewCode
//
//  Created by Ygor Nascimento on 10/10/20.
//

import UIKit

final class BuyPhotoCoordinator: BaseCoordinator {
    
    // MARK: - Private Properties
    
    private var initialViewController: UIViewController?
    private var presentingViewController: UIViewController?
    private let navigationController: UINavigationController
    private let photo: Photo
    
    // MARK: - Initialization
    
    init(navigationController: UINavigationController, photo: Photo) {
        self.navigationController = navigationController
        self.photo = photo
        self.initialViewController = navigationController.viewControllers.last
        
        super.init()
    }
    
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
        
        presentingViewController?.present(navigationController, animated: true, completion: nil)
    }
    
    override func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        if viewController === initialViewController {
            didFinishFlow?(self)
        }
    }
    
    private func finish() {

        if let viewController = initialViewController {
            navigationController.popToViewController(viewController, animated: true)
        } else {
            presentingViewController?.dismiss(animated: true, completion: nil)
            didFinishFlow?(self)
        }
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
        
        buyPhotoViewController.didShowTerms = { [weak self] in
            self?.goToTermsViewController()
        }
        
        navigationController.pushViewController(buyPhotoViewController, animated: true)
    }
    
    private func goToTermsViewController() {
        let termsCoordinator = TermsCoordinator(presentingViewController: navigationController)
        
        pushChildCoordinator(termsCoordinator)
    }
}

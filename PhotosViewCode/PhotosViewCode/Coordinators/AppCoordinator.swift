//
//  AppCoordinator.swift
//  PhotosViewCode
//
//  Created by Ygor Nascimento on 07/10/20.
//

import UIKit

final class AppCoordinator: BaseCoordinator {
    
    private enum PurchaseFlowType {
        case horizontal
        case vertical
    }

    private let navigationController = UINavigationController()

    var rootViewController: UIViewController {
        return navigationController
    }

    override func start() {
        navigationController.delegate = self
        goToHomeViewController()
    }
    
    override func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        childCoordinators.forEach { (childCoordinator) in
            childCoordinator.navigationController(navigationController, willShow: viewController, animated: true)
        }
    }
    
    override func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        childCoordinators.forEach { (childCoordinator) in
            childCoordinator.navigationController(navigationController, didShow: viewController, animated: true)
        }
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
        
        homeViewController.didBuyPhoto = { [weak self] (photo) in
            self?.goToBuyPhotoViewController(photo, purchaseFlowType: .vertical)
        }

        navigationController.pushViewController(homeViewController, animated: true)
    }

    // MARK: - goToSignInViewController
    private func goToSignInViewController() {
        let signInViewController = SignInViewController()
        
        signInViewController.didSignIn = { [weak self] (token) in
            
            UserDefaults.token = token
            
            self?.navigationController.popViewController(animated: true)
        }

        signInViewController.didCancel = { [weak self] in
            self?.navigationController.popViewController(animated: true)
        }

        navigationController.pushViewController(signInViewController, animated: true)
    }

    // MARK: - goToPhotoViewController
    private func goToPhotoViewController(_ photo: Photo) {
        let photoViewController = PhotoViewController()
        photoViewController.photo = photo
        
        photoViewController.didBuyPhoto = { [weak self] (photo) in
            self?.goToBuyPhotoViewController(photo, purchaseFlowType: .horizontal)
        }

        navigationController.pushViewController(photoViewController, animated: true)
    }

    // MARK: - goToBuyPhotoViewController
    private func goToBuyPhotoViewController(_ photo: Photo, purchaseFlowType: PurchaseFlowType) {
        let buyPhotoCoordinator: BuyPhotoCoordinator
        
        switch purchaseFlowType {
            case .horizontal:
                buyPhotoCoordinator = BuyPhotoCoordinator(navigationController: navigationController, photo: photo)
            case .vertical:
                buyPhotoCoordinator = BuyPhotoCoordinator(presentingViewController: navigationController, photo: photo)
        }

        pushChildCoordinator(buyPhotoCoordinator)
    }
}

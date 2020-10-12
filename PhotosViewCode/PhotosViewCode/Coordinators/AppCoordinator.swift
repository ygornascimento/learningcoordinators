//
//  AppCoordinator.swift
//  PhotosViewCode
//
//  Created by Ygor Nascimento on 07/10/20.
//

import UIKit

final class AppCoordinator {

    private let navigationController = UINavigationController()
    private var childCoordinators: [ChildCoordinatorsProtocol] = []

    var rootViewController: UIViewController {
        return navigationController
    }

    func start() {
        goToHomeViewController()
    }
    
    private func pushChildCoordinator(_ coordinator: ChildCoordinatorsProtocol) {
        coordinator.didFinish = { [weak self] (coordinator) in
            self?.popChildCoordinator(coordinator)
        }

        coordinator.start()
        childCoordinators.append(coordinator)
    }
    
    private func popChildCoordinator(_ coordinator: ChildCoordinatorsProtocol) {
        if let index = childCoordinators.firstIndex(where: { $0 === coordinator}) {
            childCoordinators.remove(at: index)
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
            self?.goToBuyPhotoViewController(photo)
        }

        navigationController.pushViewController(photoViewController, animated: true)
    }

    // MARK: - goToBuyPhotoViewController
    private func goToBuyPhotoViewController(_ photo: Photo) {
        let buyPhotoCoordinator = BuyPhotoCoordinator(navigationController: navigationController, photo: photo)

        pushChildCoordinator(buyPhotoCoordinator)
    }
}

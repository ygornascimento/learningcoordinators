//
//  AppCoordinator.swift
//  PhotosViewCode
//
//  Created by Ygor Nascimento on 07/10/20.
//

import UIKit

final class AppCoordinator {
    
    private let navigationController = UINavigationController()
    
    var rootViewController: UIViewController {
        return navigationController
    }
    
    func start() {
        goToHomeViewController()
    }
    
    private func goToHomeViewController() {
        let homeViewController = HomeViewController()
        
        homeViewController.didSelectPhoto = { [weak self] (photo) in
            self?.goToPhotoViewController(photo)
        }
        
        navigationController.pushViewController(homeViewController, animated: true)
    }
    
    private func goToPhotoViewController(_ photo: Photo) {
        let photoViewController = PhotoViewController()
        photoViewController.photo = photo
        
        navigationController.pushViewController(photoViewController, animated: true)
    }
}

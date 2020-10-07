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
        goToPhotosViewController()
    }
    
    private func goToPhotosViewController() {
        let photosViewController = HomeViewController()
        navigationController.pushViewController(photosViewController, animated: true)
    }
}

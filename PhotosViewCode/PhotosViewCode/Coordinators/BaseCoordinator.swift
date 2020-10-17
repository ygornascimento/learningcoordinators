//
//  BaseCoordinator.swift
//  PhotosViewCode
//
//  Created by Ygor Nascimento on 15/10/20.
//

import UIKit

class BaseCoordinator: NSObject, UINavigationControllerDelegate {
    
    var didFinishFlow: ((BaseCoordinator) -> Void)?
    var childCoordinators: [BaseCoordinator] = []
    
    func start() {}
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {}
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {}
    
    func pushChildCoordinator(_ coordinator: BaseCoordinator) {
        coordinator.didFinishFlow = { [weak self] (coordinator) in
            self?.popChildCoordinator(coordinator)
        }

        coordinator.start()
        childCoordinators.append(coordinator)
    }
    
    func popChildCoordinator(_ coordinator: BaseCoordinator) {
        if let index = childCoordinators.firstIndex(where: { $0 === coordinator}) {
            childCoordinators.remove(at: index)
        }
    }
}



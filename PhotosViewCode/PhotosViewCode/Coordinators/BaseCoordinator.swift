//
//  BaseCoordinator.swift
//  PhotosViewCode
//
//  Created by Ygor Nascimento on 15/10/20.
//

import UIKit

class BaseCoordinator: NSObject, UINavigationControllerDelegate {
    
    var didFinishFlow: ((BaseCoordinator) -> Void)?
    func start() {}
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {}
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {}
}



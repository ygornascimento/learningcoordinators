//
//  ChildCoordinatorsProtocol.swift
//  PhotosViewCode
//
//  Created by Ygor Nascimento on 10/10/20.
//

import UIKit

protocol ChildCoordinatorsProtocol: AnyObject {
    var didFinishFlow: ((ChildCoordinatorsProtocol) -> Void)? { get set }
    func start()
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool)
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool)
}

extension ChildCoordinatorsProtocol {
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {}
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {}
}

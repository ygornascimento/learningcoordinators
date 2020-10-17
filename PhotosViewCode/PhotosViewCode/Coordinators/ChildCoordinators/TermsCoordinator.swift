//
//  TermsCoordinator.swift
//  PhotosViewCode
//
//  Created by Ygor Nascimento on 17/10/20.
//

import UIKit

final class TermsCoordinator: BaseCoordinator {
    
    private let presentingViewController: UIViewController
    
    init(presentingViewController: UIViewController) {
        self.presentingViewController = presentingViewController
    }
    
    override func start() {
        goToTermsViewController()
    }
    
    private func finish() {
        presentingViewController.dismiss(animated: true, completion: nil)
        didFinishFlow?(self)
    }
    
    private func goToTermsViewController() {
        let termsViewController = TermsViewController()

        termsViewController.didCancel = { [weak self] in
            self?.finish()
        }

        presentingViewController.present(termsViewController, animated: true, completion: nil)
    }
}

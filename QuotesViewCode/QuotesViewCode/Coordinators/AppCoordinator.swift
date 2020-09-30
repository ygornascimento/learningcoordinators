//
//  AppCoordinator.swift
//  QuotesViewCode
//
//  Created by Ygor Nascimento on 29/09/20.
//  Copyright © 2020 Ygor Nascimento. All rights reserved.
//

import UIKit

final class AppCoordinator {

    private let navigationController = UINavigationController()

    var rootViewController: UIViewController {
        return navigationController
    }

    func start() {
        showQuotes()
    }

    private func showQuotes() {
        let quotesViewController = QuotesViewController()
        navigationController.pushViewController(quotesViewController, animated: true)
    }
}

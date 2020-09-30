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

        quotesViewController.didShowQuote = { [weak self] (quote) in
            self?.showQuote(quote)
        }

        quotesViewController.didShowSettings = { [weak self] in
            self?.showSettings()
        }

        navigationController.pushViewController(quotesViewController, animated: true)
    }

    private func showQuote(_ quote: Quote) {
        let quoteViewController = QuoteViewController()
        quoteViewController.quote = quote

        navigationController.pushViewController(quoteViewController, animated: true)
    }

    private func showSettings() {
        let settingsViewController = SettingsViewController()
        navigationController.present(settingsViewController, animated: true, completion: nil)
    }
}

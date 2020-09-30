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
        gotToQuotesViewController()
    }

    private func gotToQuotesViewController() {
        let quotesViewController = QuotesViewController()

        quotesViewController.goToQuote = { [weak self] (quote) in
            self?.goToQuoteViewController(quote)
        }

        quotesViewController.goToSettings = { [weak self] in
            self?.goToSettingsViewController()
        }

        navigationController.pushViewController(quotesViewController, animated: true)
    }

    private func goToQuoteViewController(_ quote: Quote) {
        let quoteViewController = QuoteViewController()
        quoteViewController.quote = quote

        navigationController.pushViewController(quoteViewController, animated: true)
    }

    private func goToSettingsViewController() {
        let settingsViewController = SettingsViewController()

        settingsViewController.popView = { [weak self] in
            self?.navigationController.popViewController(animated: true)
        }

        navigationController.pushViewController(settingsViewController, animated: true)
    }
}

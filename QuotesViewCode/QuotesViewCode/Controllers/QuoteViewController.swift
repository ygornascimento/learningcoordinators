//
//  QuoteViewController.swift
//  QuotesViewCode
//
//  Created by Ygor Nascimento on 29/09/20.
//  Copyright © 2020 Ygor Nascimento. All rights reserved.
//

import UIKit

final class QuoteViewController: UIViewController {

    private let quoteView = QuoteView()
    var quote: Quote?

    override func loadView() {
        view = quoteView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    private func setupView() {
        navigationItem.title = "Detail Quote"
        guard let author = quote?.author, let content = quote?.content else { return }
        quoteView.setupView(author: author, quote: content)

    }
}

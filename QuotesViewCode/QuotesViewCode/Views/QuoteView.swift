//
//  QuoteView.swift
//  QuotesViewCode
//
//  Created by Ygor Nascimento on 29/09/20.
//  Copyright © 2020 Ygor Nascimento. All rights reserved.
//

import UIKit

final class QuoteView: UIView {

    private var authorLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left

        return label
    }()

    private var quoteLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0

        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        //setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayout()
        //setupView()
    }

    func setupView(author: String, quote: String) {
        authorLabel.text = author
        quoteLabel.text = quote
    }

    private func setupLayout() {
        addSubview(quoteLabel)
        addSubview(authorLabel)
        quoteLabel.translatesAutoresizingMaskIntoConstraints = false
        authorLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            quoteLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            quoteLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 36),
            quoteLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -36),

            authorLabel.topAnchor.constraint(equalTo: quoteLabel.bottomAnchor, constant: 24),
            authorLabel.centerXAnchor.constraint(equalTo: quoteLabel.centerXAnchor),

        ])
    }
}

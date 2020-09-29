//
//  CellView.swift
//  QuotesViewCode
//
//  Created by Ygor Nascimento on 28/09/20.
//  Copyright © 2020 Ygor Nascimento. All rights reserved.
//

import UIKit

final class CellView: UIView {

    private var authorLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left

        return label
    }()

    private var quoteLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
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
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        quoteLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            quoteLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            quoteLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            quoteLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

            authorLabel.topAnchor.constraint(equalTo: quoteLabel.bottomAnchor, constant: 12),
            authorLabel.leadingAnchor.constraint(equalTo: quoteLabel.leadingAnchor),
            authorLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -12)

        ])
    }
}

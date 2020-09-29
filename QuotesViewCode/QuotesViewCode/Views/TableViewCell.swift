//
//  TableViewCell.swift
//  QuotesViewCode
//
//  Created by Ygor Nascimento on 28/09/20.
//  Copyright © 2020 Ygor Nascimento. All rights reserved.
//

import UIKit

final class TableViewCell: UITableViewCell {

    static var cellReuseId: String {
        return String(describing: self)
    }

    private let cellView = CellView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayout()
    }

    func configure(author: String, content: String) {
        cellView.setupView(author: author, quote: content)
    }

    private func setupLayout() {
        contentView.addSubview(cellView)
        cellView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}


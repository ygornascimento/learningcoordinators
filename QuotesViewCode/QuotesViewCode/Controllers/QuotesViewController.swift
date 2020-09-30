//
//  QuotesViewController.swift
//  QuotesViewCode
//
//  Created by Ygor Nascimento on 28/09/20.
//  Copyright © 2020 Ygor Nascimento. All rights reserved.
//

import UIKit

final class QuotesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var didShowQuote: ((Quote) -> Void)?
    var didShowSettings: (() -> Void)?

    private let quotes: [Quote] = [
        Quote(author: "Marie Curie",        content: "Be less curious about people and more curious about ideas."),
        Quote(author: "Albert Einstein",    content: "Life is like riding a bicycle. To keep your balance you must keep moving."),
        Quote(author: "Jane Goodall",       content: "Every individual matters. Every individual has a role to play. Every individual makes a difference."),
        Quote(author: "Dalai Lama",         content: "Be kind whenever possible. It is always possible."),
        Quote(author: "Margaret Atwood",    content: "A word after a word after a word is power."),
        Quote(author: "Bill Gates",         content: "Success is a lousy teacher. It seduces smart people into thinking they can't lose."),
        Quote(author: "J.K. Rowling",       content: "Happiness can be found, even in the darkest of times, if one only remembers to turn on the light."),
        Quote(author: "Steve Jobs",         content: "Design is not just what it looks like and feels like. Design is how it works."),
        Quote(author: "Rosalind Franklin",  content: "Science and everyday life cannot and should not be separated."),
        Quote(author: "Charles Darwin",     content: "A man who dares to waste one hour of time has not discovered the value of life.")
    ]

    private var table = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        table.delegate = self
        table.dataSource = self
        table.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.cellReuseId)

        setupView()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        quotes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.cellReuseId, for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }

        let quote = quotes[indexPath.row]

        cell.configure(author: quote.author, content: quote.content)

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // MARK: - Old Way
//        table.deselectRow(at: indexPath, animated: true)
//        let detailView = QuoteViewController()
//        detailView.quote = quotes[indexPath.row]
//        navigationController?.pushViewController(detailView, animated: true)

        // MARK: - New Way with Coordinator
        table.deselectRow(at: indexPath, animated: true)
        
        let quote = quotes[indexPath.row]
        didShowQuote?(quote)
    }

    private func setupView() {
        view.backgroundColor = .white
        navigationItem.title = "Quotes"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Settings", style: .plain, target: self, action: #selector(settingsTarget))

        view.addSubview(table)
        table.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            table.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            table.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    @objc private func settingsTarget() {
        // MARK: - Old Way
        //navigationController?.pushViewController(SettingsViewController(), animated: true)

        // MARK: - New Way with Coordinator
        didShowSettings?()
    }
}


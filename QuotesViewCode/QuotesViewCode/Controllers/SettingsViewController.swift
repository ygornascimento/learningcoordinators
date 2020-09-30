//
//  SettingsViewController.swift
//  QuotesViewCode
//
//  Created by Ygor Nascimento on 29/09/20.
//  Copyright © 2020 Ygor Nascimento. All rights reserved.
//

import UIKit

final class SettingsViewController: UIViewController {

    var popView: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        navigationItem.title = "Settings"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneTarget))
    }

    @objc private func doneTarget() {
        // MARK: - Old Way
//        navigationController?.popViewController(animated: true)

        // MARK: - New Way with Coordinators
        popView?()
    }
}

//
//  TermsViewController.swift
//  PhotosViewCode
//
//  Created by Ygor Nascimento on 17/10/20.
//

import UIKit

final class TermsViewController: UIViewController {
    
    var didCancel: (() -> Void)?
    
    private let termsView = TermsView()
    
    override func loadView() {
        view = termsView
        view.backgroundColor = .white
    }
    
    
}

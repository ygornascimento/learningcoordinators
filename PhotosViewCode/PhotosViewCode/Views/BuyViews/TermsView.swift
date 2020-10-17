//
//  TermsView.swift
//  PhotosViewCode
//
//  Created by Ygor Nascimento on 17/10/20.
//

import UIKit

final class TermsView: UIView {
    
    private let termsTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.text = "Terms of Service"
        
        return label
    }()
    
    private(set) var cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("Cancel", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(.systemBlue, for: .normal)
        
        return button
    }()
    
    private(set) var termsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        addSubview(termsTitleLabel)
        addSubview(cancelButton)
        addSubview(termsLabel)
        
        termsTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        termsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            termsTitleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 32),
            termsTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            cancelButton.topAnchor.constraint(equalTo: termsTitleLabel.topAnchor),
            cancelButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            termsLabel.topAnchor.constraint(equalTo: termsTitleLabel.bottomAnchor, constant: 24),
            termsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            termsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24)
        ])
    }
 }

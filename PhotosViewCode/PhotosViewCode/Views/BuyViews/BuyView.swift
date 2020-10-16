//
//  BuyView.swift
//  PhotosViewCode
//
//  Created by Ygor Nascimento on 08/10/20.
//

import UIKit

final class BuyView: UIView {
    
    private(set) var activityIndicatorView = UIActivityIndicatorView()
    
    private let imageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        
        return label
    }()
    
    private(set) var buyButton: UIButton = {
        let button = UIButton()
        button.setTitle("Buy", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(.systemBlue, for: .normal)
        
        return button
    }()
    
    private lazy var allViewsStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [imageLabel, priceLabel, buyButton])
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fill
        stack.spacing = 20
        
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViewLayout()
    }
    
    func set(imageLabel: String) {
        self.imageLabel.text = imageLabel
    }
    
    func set(priceLabel: String) {
        self.priceLabel.text = priceLabel
    }
    
    private func setupViewLayout() {
        
        addSubview(allViewsStackView)
        allViewsStackView.translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        
        NSLayoutConstraint.activate([
            allViewsStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            allViewsStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
}

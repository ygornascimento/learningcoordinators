//
//  PhotosView.swift
//  PhotosViewCode
//
//  Created by Ygor Nascimento on 07/10/20.
//

import UIKit

final class PhotosView: UIView {
    
    // MARK: - Private Properties
    let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        
        return activityIndicator
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    private let imageLabel: UILabel = {
        let label = UILabel()
 //       label.numberOfLines = 2
//        label.setContentHuggingPriority(UILayoutPriority.defaultLow, for: .horizontal)
//        label.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .vertical)
        label.setContentCompressionResistancePriority(UILayoutPriority.defaultLow, for: .horizontal)
        
        return label
    }()
    
    private(set) var buyButton: UIButton = {
        let button = UIButton()
        button.setTitle("Buy", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.setTitleColor(.systemBlue, for: .normal)
//        button.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .horizontal)
//        button.setContentHuggingPriority(UILayoutPriority.defaultLow, for: .vertical)
        button.setContentCompressionResistancePriority(UILayoutPriority.defaultHigh, for: .horizontal)
        
        return button
    }()

    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(title: String, url: URL?) {
        imageLabel.text = title
    }
    
    func set(image: UIImage) {
        imageView.image = image
    }
    
    private func setupLayout() {
        addSubview(activityIndicator)
        addSubview(imageView)
        addSubview(imageLabel)
        addSubview(buyButton)
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageLabel.translatesAutoresizingMaskIntoConstraints = false
        buyButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            imageView.heightAnchor.constraint(equalToConstant: 90),
            imageView.widthAnchor.constraint(equalToConstant: 100),
            
            activityIndicator.centerYAnchor.constraint(equalTo: imageView.centerYAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            
            imageLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 16),
            //imageLabel.trailingAnchor.constraint(equalTo: buyButton.leadingAnchor, constant: -8),
            imageLabel.centerYAnchor.constraint(equalTo: imageView.centerYAnchor),
            
            
            buyButton.leadingAnchor.constraint(equalTo: imageLabel.trailingAnchor, constant: 8),
            buyButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            buyButton.centerYAnchor.constraint(equalTo: imageLabel.centerYAnchor)
        ])
    }
    
}

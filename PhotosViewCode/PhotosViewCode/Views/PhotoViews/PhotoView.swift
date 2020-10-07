//
//  PhotoView.swift
//  PhotosViewCode
//
//  Created by Ygor Nascimento on 07/10/20.
//

import UIKit

final class PhotoView: UIView {
    
    let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        
        return activityIndicator
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    private let purchasedLabel: UILabel = {
        let label = UILabel()
        label.text = "PURCHASED"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        
        return label
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(image: UIImage) {
        imageView.image = image
    }
    
    func set(isPurchasedLabelHidden: Bool) {
        purchasedLabel.isHidden = isPurchasedLabelHidden
    }
    
    private func setupViewLayout() {
        addSubview(activityIndicator)
        addSubview(imageView)
        addSubview(purchasedLabel)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        purchasedLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            purchasedLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            purchasedLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
        
    }
}

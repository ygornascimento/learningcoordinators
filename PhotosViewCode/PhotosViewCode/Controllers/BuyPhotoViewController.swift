//
//  BuyViewController.swift
//  PhotosViewCode
//
//  Created by Ygor Nascimento on 07/10/20.
//

import UIKit

final class BuyPhotoViewController: UIViewController {
    
    var photo: Photo?
    var didCancel: (() -> Void)?
    var didBuyPhoto: ((Photo) -> Void)?
    var didShowTerms: (() -> Void)?
    
    private let buyView = BuyView()
    private let activityIndicatorView = UIActivityIndicatorView()
    
    override func loadView() {
        view = buyView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        navigationItem.hidesBackButton = true
    }
    
    private func setupView() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel(_:)))
        if let photo = photo {
            buyView.set(imageLabel: photo.title)
        }
        
        buyView.buyButton.addTarget(self, action: #selector(buyAction), for: .touchUpInside)
        buyView.termsButton.addTarget(self, action: #selector(showTerms), for: .touchUpInside)
        
        setupPriceLabel()
    }
    
    private func setupPriceLabel() {
        // Helpers
        var formattedPrice: String?
        
        if let price = photo?.price {
            // Initialize Numbe Formatter
            let numberFormatter = NumberFormatter()
            
            // Configure Numbe Formatter
            numberFormatter.locale = Locale.current
            numberFormatter.numberStyle = .currency
            
            // Update Formatted Price
            formattedPrice = numberFormatter.string(from: NSNumber(value: price))
        }
        
        if let text = formattedPrice {
            // Configure Price Label
            buyView.set(priceLabel: text)

        } else {
            // Configure Price Label
            buyView.set(priceLabel: "-")
            
            // Disable Buy Button
            buyView.buyButton.isEnabled = false
        }
    }
    
    @objc func cancel(_ sender: UIBarButtonItem) {
        didCancel?()
    }
    
    @objc func buyAction(sender: UIButton) {
        guard let photo = photo else { return }
        
        activityIndicatorView.startAnimating()
        
        // Hide Buy Button
        buyView.buyButton.isHidden = true
        
        // Disable Cancel Button
        navigationItem.rightBarButtonItem?.isEnabled = false
        
        DispatchQueue.global().async {
            sleep(2)
            
            DispatchQueue.main.async {
                // Hide Activity Indicator View
                self.activityIndicatorView.stopAnimating()
                
                // Enable Cancel Button
                self.navigationItem.rightBarButtonItem?.isEnabled = true
                
                // Invoke Handler
                self.didBuyPhoto?(photo)
            }
        }
    }
    
    @objc func showTerms(_ sender: UIButton) {
        didShowTerms?()
    }
}

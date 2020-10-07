//
//  PhotoViewController.swift
//  PhotosViewCode
//
//  Created by Ygor Nascimento on 07/10/20.
//

import UIKit

final class PhotoViewController: UIViewController {
    
    var photo: Photo?
    var didBuyPhoto: ((Photo) -> Void)?
    
    private var dataTask: URLSessionDataTask?
    private var photoView = PhotoView()
    
    override func loadView() {
        view = photoView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        title = photo?.title
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        updateView()
    }
    
    deinit {
        dataTask?.cancel()
    }
    
    private func setupView() {
        setupImageView()
        updateView()
    }
    
    private func updateView() {
        guard let photo = photo else { return }
        
        photoView.activityIndicator.startAnimating()
        
        if UserDefaults.didBuy(photo) {
            // Show Purchased View
            photoView.set(isPurchasedLabelHidden: false)
            
            // Remove Bar Button Item
            navigationItem.rightBarButtonItem = nil
        } else {
            // Show Purchased View
            photoView.set(isPurchasedLabelHidden: true)
            
            // Add Bar Button Item
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Buy", style: .plain, target: self, action: #selector(buy(_:)))
        }
    }
    
    private func setupImageView() {
        guard let url = photo?.url else {
            return
        }
        
        // Create and Resume Data Task
        dataTask = URLSession.shared.dataTask(with: url) { [weak self] (data, _, _) in
            guard let data = data else { return }
            
            // Create Image
            guard let image = UIImage(data: data) else { return }
            
            DispatchQueue.main.async {
                // Update Thumbnail Image View
                self?.photoView.set(image: image)
            }
        }
        
        // Resume Data Task
        dataTask?.resume()
    }
    
    @objc private func buy(_ sender: UIBarButtonItem) {
        guard let photo = photo else { return }
        
        didBuyPhoto?(photo)
    }
}

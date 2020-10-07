//
//  PhotosViewCell.swift
//  PhotosViewCode
//
//  Created by Ygor Nascimento on 07/10/20.
//

import UIKit

final class PhotosViewCell: UITableViewCell {
    
    private var dataTask: URLSessionDataTask?
    
    static var cellReuseIdentifier: String {
        return String(describing: self)
    }
    
    private let cellView = PhotosView()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(title: String, url: URL?) {
        // Configure Title Label
        cellView.set(title: title, url: url)
        
        // Animate Activity Indicator View
        cellView.activityIndicator.startAnimating()
        
        guard let url = url else { return }
        
        // Create and Resume Data Task
        dataTask = URLSession.shared.dataTask(with: url) { [weak self] (data, _, _) in
            guard let data = data else { return }
            
            // Create Image
            guard let image = UIImage(data: data) else { return }
            
            DispatchQueue.main.async {
                // Update Thumbnail Image View
                self?.cellView.set(image: image)
            }
        }
        
        // Resume Data Task
        dataTask?.resume()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        // Cancel Data Task
        dataTask?.cancel()
        
        // Reset Thumnail Image View
        cellView.set(image: UIImage())
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

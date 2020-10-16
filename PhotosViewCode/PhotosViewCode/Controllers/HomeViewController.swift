//
//  HomeViewController.swift
//  PhotosViewCode
//
//  Created by Ygor Nascimento on 07/10/20.
//

import UIKit

final class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var didSignIn: (() -> Void)?
    var didSelectPhoto: ((Photo) -> Void)?
    var didBuyPhoto: ((Photo) -> Void)?
    
    private var table = UITableView()
    
    private lazy var dataSource: [Photo] = [
        Photo(id: "pli", title: "Misery Ridge",                     url: URL(string: "https://cdn.cocoacasts.com/7ba5c3e7df669703cd7f0f0d4cefa5e5947126a8/1.jpg"), price: 25.99),
        Photo(id: "jyg", title: "Grand Teton Sunset",               url: URL(string: "https://cdn.cocoacasts.com/7ba5c3e7df669703cd7f0f0d4cefa5e5947126a8/2.jpg"), price: 15.99),
        Photo(id: "rdz", title: "Orange Icebergs",                  url: URL(string: "https://cdn.cocoacasts.com/7ba5c3e7df669703cd7f0f0d4cefa5e5947126a8/3.jpg"), price: 27.99),
        Photo(id: "aqs", title: "Grand Teton Sunrise",              url: URL(string: "https://cdn.cocoacasts.com/7ba5c3e7df669703cd7f0f0d4cefa5e5947126a8/4.jpg"), price: 35.99),
        Photo(id: "dfc", title: "Milky Tail",                       url: URL(string: "https://cdn.cocoacasts.com/7ba5c3e7df669703cd7f0f0d4cefa5e5947126a8/5.jpg"), price: 18.99),
        Photo(id: "gbh", title: "White Sands National Monument",    url: URL(string: "https://cdn.cocoacasts.com/7ba5c3e7df669703cd7f0f0d4cefa5e5947126a8/6.jpg"), price: 24.99),
        Photo(id: "hnj", title: "Stonehenge Storm",                 url: URL(string: "https://cdn.cocoacasts.com/7ba5c3e7df669703cd7f0f0d4cefa5e5947126a8/7.jpg"), price: 25.99),
        Photo(id: "jkr", title: "Mountain Sunrise",                 url: URL(string: "https://cdn.cocoacasts.com/7ba5c3e7df669703cd7f0f0d4cefa5e5947126a8/8.jpg"), price: 30.99),
        Photo(id: "pah", title: "Colours of Middle Earth",          url: URL(string: "https://cdn.cocoacasts.com/7ba5c3e7df669703cd7f0f0d4cefa5e5947126a8/9.jpg"), price: 50.99)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Photos"
        table.delegate = self
        table.dataSource = self
        table.register(PhotosViewCell.self, forCellReuseIdentifier: PhotosViewCell.cellReuseIdentifier)
        
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setupLayout()
        updateView()
    }
    
    @objc private func signOut(_ sender: UIBarButtonItem) {
        UserDefaults.token = nil
        updateView()
    }
    
    @objc private func signIn(_ sender: UIBarButtonItem) {
        didSignIn?()
    }
    
    // MARK: - Data Source Functions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PhotosViewCell.cellReuseIdentifier, for: indexPath) as? PhotosViewCell else {
            return UITableViewCell()
        }
        
        let photo = dataSource[indexPath.row]
        
        cell.configure(title: photo.title, url: photo.url, didBuyPhoto: UserDefaults.didBuy(photo))
        
        cell.didBuy = { [weak self] in
            self?.didBuyPhoto?(photo)
        }
        
        return cell
     }
    
    // MARK: - Delegate Functions
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let photo = dataSource[indexPath.row]
        
        didSelectPhoto?(photo)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    private func setupView() {
        setupLayout()
        updateView()
    }
    
    private func updateView() {
        
        if UserDefaults.isSignedIn {
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sign Out", style: .plain, target: self, action: #selector(signOut(_:)))
        } else {
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sign In", style: .plain, target: self, action: #selector(signIn(_:)))
        }
        
        if let indexPaths = table.indexPathsForVisibleRows {
            table.reloadRows(at: indexPaths, with: .none)
        }
    }
    
    private func setupLayout() {
        view.addSubview(table)
        table.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            table.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            table.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

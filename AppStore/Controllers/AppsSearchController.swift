//
//  AppsSearchController.swift
//  AppStore
//
//  Created by Vladimir Gusev on 23.06.2022.
//

import UIKit
import SDWebImage
 
class AppsSearchController: UICollectionViewController {
    
    // MARK: - Identifier
    private let cellId = "AppsSearchController"
    
    // MARK: - Variables
    private var results = [ResultEntity]()
    private var manager: Manager
    private var imageLoader: ImageLoader
    
    private var timer: Timer?
    
    private lazy var searchController = UISearchController()
    
    // MARK: - Initialization
    init(manager: Manager, imageLoader: ImageLoader) {
        self.manager = manager
        self.imageLoader = imageLoader
        // Not sure that it's good to do like this.
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: cellId)
        
        setupSearchBar()
    }
    
    
    // MARK: - Data source methods
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? SearchResultCell else {
            fatalError("Not a SearchResultCell")
        }
        
        cell.appResult = results[indexPath.item]

        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return results.count
    }
    
    // MARK: - Public
    func fetchItunesApps() {
        manager.fetchITunesApps(searchTerm: "Twitter") { [weak self] result in
            guard let self = self else {
                return
            }
            
            switch result {
            case .success(let result):
                self.results = result.results
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    // MARK: - Private
    private func setupSearchBar() {
        definesPresentationContext = true
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension AppsSearchController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return .init(width: view.frame.width, height: 350)
    }
}

// MARK: - SearchBarDelegate
extension AppsSearchController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        timer?.invalidate()
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { [weak self] _ in
            guard let self = self else {
                return
            }
            
            self.manager.fetchITunesApps(searchTerm: searchText) { result in
                switch result {
                case .success(let result):
                    self.results = result.results
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                case .failure(let error):
                    print(error)
                }
            }
        })
    }
}

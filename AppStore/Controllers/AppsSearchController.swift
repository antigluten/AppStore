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
    fileprivate let cellId = "AppsSearchController"
    
    // MARK: - Variables
    private var results = [ResultEntity]()
    private var manager: Manager
    private var imageLoader: ImageLoader
    
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
        
        fetchItunesApps()
        
        // MARK: - Search Controller
        navigationItem.searchController = UISearchController()
        navigationItem.hidesSearchBarWhenScrolling = false
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
        manager.fetchITunesApps() { [weak self] result in
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
    
}

// MARK: - UICollectionViewDelegateFlowLayout

extension AppsSearchController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return .init(width: view.frame.width, height: 350)
    }
}

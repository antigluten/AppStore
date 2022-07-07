//
//  AppsPageController.swift
//  AppStore
//
//  Created by Vladimir Gusev on 29.06.2022.
//

import UIKit

class AppsPageController: BaseListController {
    
    var manager: Manager? {
        didSet {
            fetchAppsData()
        }
    }
    
    private var group: AppGroup?
    
    static let identifier = "AppsPageController"
    static let headerIdentifier = "AppsPageControllerHeader"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(AppsGroupCell.self, forCellWithReuseIdentifier: AppsPageController.identifier)
        collectionView.register(AppsPageHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: AppsPageController.headerIdentifier)
        
        // MARK: - Fetching Data
        fetchAppsData()
    }
    
    private func fetchAppsData() {
        if manager == nil {
            print("fuck")
        }
        manager?.fetchGames(completion: { [weak self] result in
            switch result {
            case .success(let group):
                self?.group = group
                DispatchQueue.main.async {
                    self?.collectionView.reloadData()
                }
                
            case .failure(let error):
                print(error)
                
            }
        })
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppsPageController.identifier, for: indexPath) as? AppsGroupCell else { return UICollectionViewCell() }
        
        cell.titleLabel.text = group?.feed.title
        
        if let results = group?.feed.results {
            cell.horizontalController.results = results
        }
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: AppsPageController.headerIdentifier, for: indexPath)
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
    
}

extension AppsPageController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 16, left: 0, bottom: 0, right: 0)
    }
}

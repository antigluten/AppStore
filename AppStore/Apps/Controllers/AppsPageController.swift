//
//  AppsPageController.swift
//  AppStore
//
//  Created by Vladimir Gusev on 29.06.2022.
//

import UIKit

class AppsPageController: BaseListController {
    
    let activityIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .large)
        view.color = .black
        view.startAnimating()
        view.hidesWhenStopped = true
        return view
    }()
    
    var manager: Manager? {
        didSet {
            fetchAppsData()
        }
    }
    
    private var groups = [AppGroup]()
    private var socialApps = [SocialApp]()
    
    static let identifier = "AppsPageController"
    static let headerIdentifier = "AppsPageControllerHeader"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(AppsGroupCell.self, forCellWithReuseIdentifier: AppsPageController.identifier)
        collectionView.register(AppsPageHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: AppsPageController.headerIdentifier)
        
        view.addSubview(activityIndicator)
        activityIndicator.fillSuperview()
        
        // MARK: - Fetching Data
        fetchAppsData()
    }
    
    private func fetchAppsData() {
        let dispatchGroup = DispatchGroup()
        
        manager?.fetchGames(type: .topFreeGB) { [weak self] result in
            dispatchGroup.enter()
            defer {
                dispatchGroup.leave()
            }
            
            switch result {
            case .success(let group):
                self?.groups.append(group)
            case .failure(let error):
                print(error)
                
            }
        }
        
        manager?.fetchGames(type: .topPaid) { [weak self] result in
            dispatchGroup.enter()
            defer {
                dispatchGroup.leave()
            }
            
            switch result {
            case .success(let group):
                self?.groups.append(group)
            case .failure(let error):
                print(error)
                
            }
        }
        
        manager?.fetchTrending { [weak self] result in
            dispatchGroup.enter()
            defer {
                dispatchGroup.leave()
            }
            
            switch result {
            case .success(let socialApps):
                self?.socialApps = socialApps
            case .failure(let error):
                print(error)
                
            }
        }
        
        dispatchGroup.notify(queue: .main) { [weak self] in
            self?.activityIndicator.stopAnimating()
            self?.collectionView.reloadData()
        }
        
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groups.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppsPageController.identifier, for: indexPath) as? AppsGroupCell else { return UICollectionViewCell() }
        
        let feed = groups[indexPath.row].feed
        cell.titleLabel.text = feed.title
        cell.horizontalController.results = feed.results
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: AppsPageController.headerIdentifier, for: indexPath) as? AppsPageHeader else {
            return UICollectionReusableView()
        }
        
        header.horizontalController.socialApps = socialApps
        
        
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

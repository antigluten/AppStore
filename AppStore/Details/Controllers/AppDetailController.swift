//
//  AppDetailController.swift
//  AppStore
//
//  Created by Vladimir Gusev on 09.07.2022.
//

import UIKit

class AppDetailController: BaseListController {
    
    var manager: Manager?
    
    var id: String! {
        didSet {
            fetchDetails(by: id)
        }
    }
    
    var result: SearchResult?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never
        
        collectionView.backgroundColor = .systemBackground
        collectionView.register(AppDetailCell.self, forCellWithReuseIdentifier: AppDetailCell.identifier)
    }
    
    func fetchDetails(by id: String) {
        manager?.fetchApp(endpoint: .lookup, searchTerm: id, completion: { [weak self] result in
            switch result {
            case .success(let result):
                self?.result = result
            case .failure(let error):
                print(error)
            }
        })
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppDetailCell.identifier, for: indexPath) as? AppDetailCell else {
            return UICollectionViewCell()
        }
        
//        cell.backgroundColor = .systemPink
        
        return cell
    }
    
}

extension AppDetailController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.frame.width, height: 300)
    }
}

//
//  AppsHorizontalController.swift
//  AppStore
//
//  Created by Vladimir Gusev on 04.07.2022.
//

import UIKit

class AppsHorizontalController: BaseListController {
    static let identifier = "AppsHorizontalController"
    
    override func viewDidLoad() {
        collectionView.backgroundColor = .systemPink
        collectionView.register(AppCell.self, forCellWithReuseIdentifier: AppCell.identifier)
        
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
    }
 
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppCell.identifier, for: indexPath)
        cell.backgroundColor = .yellow
        return cell
    }
}

extension AppsHorizontalController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 32, height: view.frame.height - 32)
    }
}
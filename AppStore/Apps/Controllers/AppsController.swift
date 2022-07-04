//
//  AppsController.swift
//  AppStore
//
//  Created by Vladimir Gusev on 29.06.2022.
//

import UIKit

class AppsController: BaseListController {
    
    private static let identifier = "AppsController"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(AppsGroupCell.self, forCellWithReuseIdentifier: AppsController.identifier)
        
        collectionView.backgroundColor = .systemMint
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppsController.identifier, for: indexPath)

        cell.backgroundColor = .yellow
        return cell
    }
}

extension AppsController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 250)
    }
}

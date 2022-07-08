//
//  AppsHeaderHorizontalController.swift
//  AppStore
//
//  Created by Vladimir Gusev on 05.07.2022.
//

import UIKit

class AppsHeaderHorizontalController: BaseListController {
    
    var socialApps = [SocialApp]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(AppHeaderCell.self, forCellWithReuseIdentifier: AppHeaderCell.identifier)
        
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return socialApps.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppHeaderCell.identifier, for: indexPath) as? AppHeaderCell else {
            return UICollectionViewCell()
        }
        
        let model = socialApps[indexPath.row]
        
        cell.imageView.sd_setImage(with: URL(string: model.imageUrl))
        cell.titleLabel.text = model.tagline
        cell.companyNameLabel.text = model.name
        
        return cell
    }
}

extension AppsHeaderHorizontalController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 48, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 16, bottom: 0, right: 16)
    }
}

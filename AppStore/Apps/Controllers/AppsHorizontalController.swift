//
//  AppsHorizontalController.swift
//  AppStore
//
//  Created by Vladimir Gusev on 04.07.2022.
//

import UIKit

class AppsHorizontalController: HorizontalSnappingController {
    static let identifier = "AppsHorizontalController"
    
    var results = [FeedResult]()
    
    private let topBottomPadding: CGFloat = 12
    private let lineSpacing: CGFloat = 10
    
    override func viewDidLoad() {
        collectionView.backgroundColor = .systemBackground
        collectionView.register(AppRowCell.self, forCellWithReuseIdentifier: AppRowCell.identifier)
        collectionView.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)
    }
 
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return results.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppRowCell.identifier, for: indexPath) as? AppRowCell else {
            return UICollectionViewCell()
        }
        
        let model = results[indexPath.row]
        
        cell.appLabel.text = model.name
        cell.companyLabel.text = model.artistName
        cell.imageView.sd_setImage(with: URL(string: model.artworkUrl100))
        
        return cell
    }
}

extension AppsHorizontalController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width - 48
        let height = (view.frame.height - 2 * topBottomPadding - 2 * lineSpacing) / 3
        return .init(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return lineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: topBottomPadding, left: 0, bottom: topBottomPadding, right: 0)
    }
}

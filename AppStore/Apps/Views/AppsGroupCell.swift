//
//  AppsGroupCell.swift
//  AppStore
//
//  Created by Vladimir Gusev on 29.06.2022.
//

import UIKit

class AppsGroupCell: UICollectionViewCell {
    static let identifier = "AppsGroupCell"
    
    let titleLabel = UILabel(text: "App Section", font: .boldSystemFont(ofSize: 30))
    
    let horizontalController = AppsHorizontalController()
 
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor,
                          padding: .init(top: 0, left: 16, bottom: 0, right: 0))
        addSubview(horizontalController.view)
        horizontalController.view.anchor(top: titleLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
    }
}

//
//  AppHeaderCell.swift
//  AppStore
//
//  Created by Vladimir Gusev on 05.07.2022.
//

import UIKit

class AppHeaderCell: UICollectionViewCell {
    static let identifier = "AppHeaderCell"
    
    let changeLabel = UILabel(text: "FEATURED", font: .boldSystemFont(ofSize: 12))
    let appNameLabel = UILabel(text: "AppName and some other information about something curious", font: .systemFont(ofSize: 22))
    let imageView = UIImageView(cornerRadius: 6)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        appNameLabel.numberOfLines = 2
        changeLabel.textColor = .link
        
        imageView.backgroundColor = .systemPink
        
        let stack = VerticalStackView(arrangedSubviews: [
            changeLabel,
            appNameLabel,
            imageView
        ], spacing: 12)
        
//        stack.distribution = .equalSpacing
        
        
        addSubview(stack)
        stack.fillSuperview(padding: .init(top: 16, left: 0, bottom: 0, right: 0))
    }
}

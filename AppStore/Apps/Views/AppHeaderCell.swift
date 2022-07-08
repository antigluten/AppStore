//
//  AppHeaderCell.swift
//  AppStore
//
//  Created by Vladimir Gusev on 05.07.2022.
//

import UIKit

class AppHeaderCell: UICollectionViewCell {
    static let identifier = "AppHeaderCell"
    
    let companyNameLabel = UILabel(text: "FEATURED", font: .boldSystemFont(ofSize: 12))
    let titleLabel = UILabel(text: "AppName and some other information about something curious", font: .systemFont(ofSize: 24))
    let imageView = UIImageView(cornerRadius: 6, contentMode: .scaleAspectFill)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleLabel.numberOfLines = 2
        companyNameLabel.textColor = .link
        
        let stack = VerticalStackView(arrangedSubviews: [
            companyNameLabel,
            titleLabel,
            imageView
        ], spacing: 4)
        
        stack.distribution = .equalCentering
        
        addSubview(stack)
        stack.fillSuperview(padding: .init(top: 16, left: 0, bottom: 0, right: 0))
    }
}

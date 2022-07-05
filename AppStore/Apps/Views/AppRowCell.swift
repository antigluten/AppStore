//
//  AppRowCell.swift
//  AppStore
//
//  Created by Vladimir Gusev on 04.07.2022.
//

import UIKit

class AppRowCell: UICollectionViewCell {
    static let identifier = "AppRowCell"
    
    let imageView = UIImageView(cornerRadius: 12)
    
    let appLabel = UILabel(text: "App Name", font: .systemFont(ofSize: 16))
    let companyLabel = UILabel(text: "Company name", font: .systemFont(ofSize: 12))
    
    let getButton = UIButton(title: "GET", font: .boldSystemFont(ofSize: 16))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
//        super.layoutSubviews()
        imageView.backgroundColor = .purple
        
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 64),
            imageView.widthAnchor.constraint(equalToConstant: 64)
        ])
        
        getButton.constrainWidth(constant: 80)
        getButton.constrainHeight(constant: 32)
        
        let verticalStackView = VerticalStackView(arrangedSubviews: [appLabel, companyLabel], spacing: 4)
        
        let horizontalStackView = HorizontalStackView(arrangedSubviews: [
            imageView, verticalStackView, getButton
        ], spacing: 12)
        
        horizontalStackView.alignment = .center
        
        addSubview(horizontalStackView)
        horizontalStackView.fillSuperview()
    }
    
}

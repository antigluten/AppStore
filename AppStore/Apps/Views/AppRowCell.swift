//
//  AppCell.swift
//  AppStore
//
//  Created by Vladimir Gusev on 04.07.2022.
//

import UIKit

class AppCell: UICollectionViewCell {
    static let identifier = "AppCell"
    
    let imageView = UIImageView(cornerRadius: 12)
    
    let appLabel = UILabel(text: "App Name", font: .systemFont(ofSize: 16))
    let companyLabel = UILabel(text: "Company name", font: .systemFont(ofSize: 12))
    
    let getButton = UIButton(title: "GET")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        imageView.backgroundColor = .purple
        
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 64),
            imageView.widthAnchor.constraint(equalToConstant: 64)
        ])
        
        getButton.backgroundColor = UIColor(white: 0.95, alpha: 1)
        getButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
        getButton.constrainWidth(constant: 80)
        getButton.constrainHeight(constant: 32)
        getButton.layer.cornerRadius = 16
        
        let verticalStackView = VerticalStackView(arrangedSubviews: [appLabel, companyLabel], spacing: 4)
        
        let horizontalStackView = HorizontalStackView(arrangedSubviews: [
            imageView, verticalStackView, getButton
        ], spacing: 12)
        
        horizontalStackView.alignment = .center
        
        addSubview(horizontalStackView)
        horizontalStackView.fillSuperview()
    }
    
}

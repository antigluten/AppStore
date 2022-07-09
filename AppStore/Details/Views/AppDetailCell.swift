//
//  AppDetailCell.swift
//  AppStore
//
//  Created by Vladimir Gusev on 09.07.2022.
//

import UIKit

class AppDetailCell: UICollectionViewCell {
    
    static let identifier = "AppDetailCell"
    
    let iconImageView = UIImageView(cornerRadius: 16)
    let nameLabel = UILabel(text: "App Name", font: .boldSystemFont(ofSize: 24), numberOfLines: 2)
    let priceButton: UIButton = {
        let button = UIButton(title: "Free")
        button.backgroundColor = .link
        button.constrainHeight(constant: 32)
        button.layer.cornerRadius = 16
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    let whatsNew = UILabel(text: "What's New", font: .boldSystemFont(ofSize: 20))
    let releaseNotesLabel = UILabel(text: "Release Notes", font: .systemFont(ofSize: 16), numberOfLines: 0 )
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        iconImageView.backgroundColor = .red
        
        iconImageView.constrainWidth(constant: 140)
        iconImageView.constrainHeight(constant: 140)
        
        priceButton.constrainWidth(constant: 80)
        
        let internalHorizontalStack = HorizontalStackView(arrangedSubviews: [
            priceButton, UIView()
        ], spacing: 12)
        
        let verticalStack = VerticalStackView(arrangedSubviews: [
            nameLabel,
            UIView(),
            internalHorizontalStack
        ], spacing: 12)
        
        let horizontalStack = HorizontalStackView(arrangedSubviews: [
            iconImageView, verticalStack
        ], spacing: 20)
        
        let overallStack = VerticalStackView(arrangedSubviews: [
            horizontalStack,
            whatsNew,
            releaseNotesLabel
        ], spacing: 12)
        
        addSubview(overallStack)
        overallStack.fillSuperview(padding: .init(top: 20, left: 20, bottom: 20, right: 20))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

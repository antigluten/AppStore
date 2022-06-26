//
//  SearchResultCell.swift
//  AppStore
//
//  Created by Vladimir Gusev on 23.06.2022.
//

import UIKit

class SearchResultCell: UICollectionViewCell {
    
    // MARK: - Views
    
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 64),
            imageView.heightAnchor.constraint(equalToConstant: 64)
        ])
        
        imageView.layer.cornerRadius = 16
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name Label"
        return label
    }()
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Photos&Videos"
        return label
    }()
    
    let ratingLabel: UILabel = {
        let label = UILabel()
        label.text = "9.26M"
        return label
    }()
    
    let getButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("GET", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        
        button.backgroundColor = .init(white: 0.9, alpha: 1)
        button.layer.cornerRadius = 16
        
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 80),
            button.heightAnchor.constraint(equalToConstant: 32)
        ])
        
        return button
    }()
    
    lazy var overallStackView = VerticalStackView()
 
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let infoTopStackView = HorizontalStackView(arrangedSubviews: [
            iconImageView,
            VerticalStackView(arrangedSubviews: [nameLabel, categoryLabel, ratingLabel]),
            getButton,
        ], spacing: 12)
        infoTopStackView.alignment = .center
        
        overallStackView = VerticalStackView(arrangedSubviews: [
            infoTopStackView
        ], spacing: 10)
        
        addSubview(overallStackView)
        
        let padding: CGFloat = 16
        overallStackView.fillSuperview(padding: .init(top: padding, left: padding, bottom: padding, right: padding))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public
    func updateScreenshots(_ screenshots: [UIImageView]) {
        let screenshotStackView = HorizontalStackView(arrangedSubviews: screenshots, spacing: 10)
        screenshotStackView.distribution = .fillEqually
        
        overallStackView.addArrangedSubview(screenshotStackView)
    }
    
    // MARK: - Private
    func createScreenshotImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.backgroundColor = .orange
        return imageView
    }
}

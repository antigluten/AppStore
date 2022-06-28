//
//  SearchResultCell.swift
//  AppStore
//
//  Created by Vladimir Gusev on 23.06.2022.
//

import UIKit

class SearchResultCell: UICollectionViewCell {
    
    var appResult: ResultEntity! {
        didSet {
            nameLabel.text = appResult.trackName
            categoryLabel.text = appResult.primaryGenreName
            
            let url = URL(string: appResult.artworkUrl100)
            iconImageView.sd_setImage(with: url)
            
            screenshot1ImageView.sd_setImage(with: URL(string: appResult.screenshotUrls[0]))
            if appResult.screenshotUrls.count > 1 {
                screenshot2ImageView.sd_setImage(with: URL(string: appResult.screenshotUrls[1]))
            }
            
            if appResult.screenshotUrls.count > 2 {
                screenshot3ImageView.sd_setImage(with: URL(string: appResult.screenshotUrls[2]))
            }
        }
    }
    
    // MARK: - Views
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        
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
    
    lazy var screenshot1ImageView = createScreenshotImageView()
    lazy var screenshot2ImageView = createScreenshotImageView()
    lazy var screenshot3ImageView = createScreenshotImageView()
 
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let infoTopStackView = HorizontalStackView(arrangedSubviews: [
            iconImageView,
            VerticalStackView(arrangedSubviews: [nameLabel, categoryLabel, ratingLabel]),
            getButton,
        ], spacing: 12)
        infoTopStackView.alignment = .center
        
        let screenshotsStackView = HorizontalStackView(arrangedSubviews: [
            screenshot1ImageView, screenshot2ImageView, screenshot3ImageView
        ], spacing: 12)
        screenshotsStackView.distribution = .fillEqually
        
        let overallStackView = VerticalStackView(arrangedSubviews: [
            infoTopStackView, screenshotsStackView
        ], spacing: 10)
        
        addSubview(overallStackView)
        
        let padding: CGFloat = 12
        overallStackView.fillSuperview(padding: .init(top: padding, left: padding, bottom: padding, right: padding))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private
    func createScreenshotImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 0.5
        imageView.layer.borderColor = UIColor(white: 0.5, alpha: 1).cgColor
        imageView.contentMode = .scaleAspectFill
        return imageView
    }
}

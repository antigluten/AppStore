//
//  AppsGroupCell.swift
//  AppStore
//
//  Created by Vladimir Gusev on 29.06.2022.
//

import UIKit

class AppsGroupCell: UICollectionViewCell {
    
    let header: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Text"
        view.font = .systemFont(ofSize: 32)
        view.backgroundColor = .gray
        return view
    }()
    
    let horizontalController = AppsHorizontalController()
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        addSubview(header)
        
        layoutHeader()
        
        addSubview(horizontalController.view)
        horizontalController.view.anchor(top: header.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
        
    }
    
    private func layoutHeader() {
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: topAnchor),
            header.leadingAnchor.constraint(equalTo: leadingAnchor),
            header.trailingAnchor.constraint(equalTo: trailingAnchor),
            header.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

}

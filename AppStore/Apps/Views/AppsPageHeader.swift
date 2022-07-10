//
//  AppsPageHeader.swift
//  AppStore
//
//  Created by Vladimir Gusev on 05.07.2022.
//

import UIKit

class AppsPageHeader: UICollectionReusableView {
    static let identifier = "AppsPageHeader"
    
    let horizontalController = AppsHeaderHorizontalController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        horizontalController.view.backgroundColor = .gray
        
        addSubview(horizontalController.view)
        horizontalController.view.fillSuperview()
    }

}

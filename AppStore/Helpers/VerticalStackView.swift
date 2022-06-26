//
//  VerticalStackView.swift
//  AppStore
//
//  Created by Vladimir Gusev on 24.06.2022.
//

import UIKit

class VerticalStackView: UIStackView {
    
    // MARK: - Initialization
    init() {
        super.init(frame: .zero)
        axis = .vertical
    }
    
    init(arrangedSubviews: [UIView], spacing: CGFloat = 0) {
        super.init(frame: .zero)
        
        arrangedSubviews.forEach { addArrangedSubview($0) }
        
        axis = .vertical
        self.spacing = spacing
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

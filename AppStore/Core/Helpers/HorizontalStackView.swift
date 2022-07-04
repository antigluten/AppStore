//
//  HorizontalStackView.swift
//  AppStore
//
//  Created by Vladimir Gusev on 24.06.2022.
//

import UIKit

class HorizontalStackView: UIStackView {
    // MARK: - Initialization
    init(arrangedSubviews: [UIView], spacing: CGFloat = 0) {
        super.init(frame: .zero)
        
        arrangedSubviews.forEach { addArrangedSubview($0) }
        
        axis = .horizontal
        self.spacing = spacing
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

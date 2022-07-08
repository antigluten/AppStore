//
//  UIImageView+Init.swift
//  AppStore
//
//  Created by Vladimir Gusev on 05.07.2022.
//

import UIKit

extension UIImageView {
    convenience init(cornerRadius: CGFloat) {
        self.init(image: nil)
        clipsToBounds = true
        layer.cornerRadius = cornerRadius
        contentMode = .scaleAspectFill
    }
    
    convenience init(cornerRadius: CGFloat, contentMode: UIView.ContentMode) {
        self.init(frame: .zero)
        clipsToBounds = true
        layer.cornerRadius = cornerRadius
        self.contentMode = contentMode
    }
}

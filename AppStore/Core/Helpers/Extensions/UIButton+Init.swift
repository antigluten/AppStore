//
//  UIButton+Init.swift
//  AppStore
//
//  Created by Vladimir Gusev on 05.07.2022.
//

import UIKit

extension UIButton {
    convenience init(title: String) {
        self.init(type: .system)
        self.setTitle(title, for: .normal)
    }
    
    convenience init(title: String, font: UIFont) {
        self.init(type: .system)
        
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = font
        backgroundColor = .init(white: 0.95, alpha: 1)
        layer.cornerRadius = 16
    }
}

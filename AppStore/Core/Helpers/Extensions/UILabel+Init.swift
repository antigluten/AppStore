//
//  UILabel+Init.swift
//  AppStore
//
//  Created by Vladimir Gusev on 05.07.2022.
//

import UIKit

extension UILabel {
    convenience init(text: String, font: UIFont, numberOfLines: Int = 1) {
        self.init(frame: .zero)
        self.text = text
        self.font = font
        self.numberOfLines = numberOfLines
    }
}

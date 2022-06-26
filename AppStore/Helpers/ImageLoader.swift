//
//  ImageLoader.swift
//  AppStore
//
//  Created by Vladimir Gusev on 26.06.2022.
//

import Foundation
import SDWebImage

class ImageLoader {
    func setImage(with url: String, to imageView: UIImageView) {
        guard let url = URL(string: url) else {
            return
        }
        
        imageView.sd_setImage(with: url)
    }
    
    func loadImage(with url: String) -> UIImageView {
        let imageView = UIImageView()
        setImage(with: url, to: imageView)
        
        return imageView
    }
    
}

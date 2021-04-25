//
//  CustomView.swift
//  MToon_G5
//
//  Created by Computer on 4/24/21.
//  Copyright © 2021 Computer. All rights reserved.
//

import UIKit

@IBDesignable
class CustomView: UIView {
    @IBInspectable var backgroundImage: UIImage? {
        didSet {
            if let image = backgroundImage {
                let imageView = UIImageView()
                
                imageView.frame = CGRect(x: bounds.origin.x, y: bounds.origin.y, width: bounds.width * 0.85, height: bounds.height)
                imageView.image = image
                imageView.contentMode = .scaleToFill
                
                insertSubview(imageView, at: 0)
            }
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
}

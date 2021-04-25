//
//  CustomLable.swift
//  MToon_G5
//
//  Created by Computer on 4/24/21.
//  Copyright © 2021 Computer. All rights reserved.
//

import UIKit

@IBDesignable
class CustomLable: UILabel {
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = true
        }
    }
    
}

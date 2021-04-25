//
//  CustomView.swift
//  MToon_G5
//
//  Created by Computer on 4/23/21.
//  Copyright © 2021 Computer. All rights reserved.
//

import UIKit

@IBDesignable
class CustomTableViewCell: UITableViewCell {
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            let verticalPadding: CGFloat = 8
            let maskLayer = CALayer()
            maskLayer.cornerRadius = cornerRadius
            maskLayer.borderWidth = 1
            maskLayer.borderColor = UIColor.black.cgColor
            
            maskLayer.backgroundColor = UIColor.white.cgColor
            maskLayer.frame = CGRect(x: bounds.origin.x, y: bounds.origin.y, width: bounds.width * 0.84, height: bounds.height).insetBy(dx: 0, dy: verticalPadding/2)
            layer.mask = maskLayer
        }
    }
}

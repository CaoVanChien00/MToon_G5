//
//  CustomTableView.swift
//  MToon_G5
//
//  Created by Computer on 4/24/21.
//  Copyright © 2021 Computer. All rights reserved.
//

import UIKit

@IBDesignable
class CustomTableView: UITableView {
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
}

//
//  Image.swift
//  MToon_G5
//
//  Created by Computer on 4/25/21.
//  Copyright © 2021 Computer. All rights reserved.
//

import UIKit

class Image {
    
    func downoadImage(link: String, imageView: UIImageView) {
        
        let url = URL(string: link)
        
        DispatchQueue.global().async { 
            if let data = try? Data(contentsOf: url!) {
                if let imageSW = UIImage(data: data) {
                    DispatchQueue.main.async {
                        imageView.image = imageSW
                    }
                }
            }
        }
    }
    
}

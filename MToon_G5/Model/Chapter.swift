//
//  Chapter.swift
//  MToon_G5
//
//  Created by Computer on 4/26/21.
//  Copyright © 2021 Computer. All rights reserved.
//

import UIKit

class Chapter {
    
    //MARK: Khai báo biến
    var ID: String?
    var chapter: Int?
    var name: String?
    var content: [String] = []
    
    //MARK: Hàm khởi tạo
    init() {
    }
    
    init(ID: String, chapter: Int, name: String, content: [String]) {
        self.ID = ID
        self.chapter = chapter
        self.name = name
        self.content = content
    }
}

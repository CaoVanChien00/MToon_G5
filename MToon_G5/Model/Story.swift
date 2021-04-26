//
//  Story.swift
//  MToon_G5
//
//  Created by Computer on 4/26/21.
//  Copyright © 2021 Computer. All rights reserved.
//

import Foundation

class Story {
    //MARK: Khai báo biến
    var ID: String?
    var name: String?
    var thumb: String?
    var author: String?
    var poster: String?
    var posterID: String?
    var curentChapter: Int?
    var chapter:[[Float:String]] = []
    var countView: Int?
    var countLike: Int?
    var rating: Float?
    
    //MARK: Hàm khởi tạo
    init() {
    }
    
    init(ID: String, name: String, thumb: String, author: String, poster: String, posterID: String, curentChapter: Int, chapter:[[Float:String]], countView: Int, countLike: Int, rating: Float) {
        self.ID = ID
        self.name = name
        self.thumb = thumb
        self.author = author
        self.poster = poster
        self.posterID = posterID
        self.curentChapter = curentChapter
        self.chapter = chapter
        self.countView = countView
        self.countLike = countLike
        self.rating = rating
    }
    
}

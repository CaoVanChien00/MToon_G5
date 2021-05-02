//
//  Chapter.swift
//  MToon_G5
//
//  Created by Computer on 5/2/21.
//  Copyright © 2021 Computer. All rights reserved.
//

import Foundation

class Chapter {
    var id: String?
    var name: String?
    var content: [String]?
    
    init() {
    }
    
    init(id: String, name: String, content: [String]) {
        self.id = id
        self.name = name
        self.content = content
    }
    
    init(name: String, content: [String]) {
        self.name = name
        self.content = content
    }
    
    func getChapter() -> [String: Any]?{
        if let id = self.id, let name = self.name, let content = self.content {
            return [
                "ID": id,
                "Name": name,
                "Content": content
            ]
        }
        
        return nil
    }
    
    func setChapter(data: [String: Any]) {
        self.id = data["ID"] as? String
        self.name = data["Name"] as? String
        self.content = data["Content"] as? [String]
    }
}

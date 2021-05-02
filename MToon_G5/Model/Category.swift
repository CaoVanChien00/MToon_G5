//
//  Category.swift
//  MToon_G5
//
//  Created by Computer on 5/2/21.
//  Copyright © 2021 Computer. All rights reserved.
//

import Foundation

class Category {
    var name: String?
    var id: String?
    
    init(name: String) {
        self.name = name
    }
    
    init(name: String, id: String) {
        self.name = name
        self.id = id
    }
    
    func getCategory() -> [String: String]? {
        if let name = self.name, let id = self.id {
            return [
                "Name": name,
                "ID": id
            ]
        }
        return nil
    }
    
    func setCategory(data: [String: Any]) {
        self.name = data["Name"] as? String
        self.id = data["ID"] as? String
    }
}

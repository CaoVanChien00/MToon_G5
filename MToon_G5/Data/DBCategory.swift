//
//  DBCategory.swift
//  MToon_G5
//
//  Created by Computer on 5/2/21.
//  Copyright © 2021 Computer. All rights reserved.
//

import Firebase

class DBCategory {
    private var DB = Firestore.firestore().collection("Categorys")
    
    func addCategory(category: Category, compeletion: ((Bool) -> ())?) {
        let id = DB.document().documentID
        
        category.id = id
        
        if let data = category.getCategory() {
            DB.document(id).setData(data)
            if let compeletion = compeletion {
                compeletion(true)
            }
        }
        
        if let compeletion = compeletion {
            compeletion(false)
        }
    }
    
    func getAllCategory(compeletion: @escaping ([[String: String]]?) -> ()) {
        var arr = [[String: String]]()
        DB.getDocuments(){
            data, error in
            if error == nil {
                if let data = data {
                    for item in data.documents {
                        arr.append(item.data() as! [String:String])
                    }
                }
                compeletion(arr)
            }else{
                compeletion(nil)
            }
        }
    }
    
    func deleteCategoryByID(id: String, compeletion: @escaping (Error?) -> ()) {
        DB.document(id).delete(){
            error in
            compeletion(error)
        }
    }
    
    func checkIsAvailable(name: String, compeletion: @escaping (Bool) -> ()) {
        DB.whereField("Name", isEqualTo: name).limit(to: 1).getDocuments(){
            data, error in
            if error == nil {
                if let data = data {
                    if data.documents.count == 0 {
                        compeletion(true)
                    } else {
                        compeletion(false)
                    }
                }
            }
        }
        
    }
}

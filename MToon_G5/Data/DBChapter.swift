//
//  DBChapter.swift
//  MToon_G5
//
//  Created by Computer on 5/2/21.
//  Copyright © 2021 Computer. All rights reserved.
//

import Firebase

class DBChapter {
    private var DB = Firestore.firestore().collection("Chapters")
    
    func addChapter(chapter: Chapter, compeletion: ((Bool) -> ())?) {
        let id = DB.document().documentID
        
        chapter.id = id
        
        if let data = chapter.getChapter() {
            DB.document(id).setData(data)
            if let compeletion = compeletion {
                compeletion(true)
            }
        }
        
        if let compeletion = compeletion {
            compeletion(false)
        }
    }
    
    func getChapterByID(id: String, compeletion: @escaping (Chapter?) -> ()) {
        DB.document(id).getDocument(){
            item, error in
            if error == nil {
                if let item = item {
                    let chapter = Chapter(id: item["ID"] as! String, name: item["Name"] as! String, content: item["Content"] as! [String])
                    compeletion(chapter)
                }
                compeletion(nil)
            }else{
                compeletion(nil)
            }
        }
    }
    
    func deleteChapterByID(id: String, compeletion: @escaping (Error?) -> ()) {
        DB.document(id).delete(){
            error in
            compeletion(error)
        }
    }
}

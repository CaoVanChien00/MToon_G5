//
//  User.swift
//  MToon_G5
//
//  Created by Computer on 4/26/21.
//  Copyright © 2021 Computer. All rights reserved.
//
import UIKit

class User {
    
    //MARK: Khai báo biến
    var ID: String?
    var avatar: String?
    var name: String?
    var account: String?
    var email: String?
    var point: Int?
    var isStatus: Bool?
    
    //MARK: Hàm khởi tạo
    init() {
    }
    
    init(ID: String, avatar: String, name: String, account: String, email: String, point: Int, isStatus: Bool) {
        self.ID = ID
        self.avatar = avatar
        self.name = name
        self.account = account
        self.email = email
        self.point = point
        self.isStatus = isStatus
    }
    
    //MARK: Hàm check email
    func validateEmail(enteredEmail:String) -> Bool {
        if enteredEmail.count != 0 {
            let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
            return emailPredicate.evaluate(with: enteredEmail)
        }
        
        return false
    }
}

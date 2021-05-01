//
//  MainViewController.swift
//  MToon_G5
//
//  Created by Computer on 4/27/21.
//  Copyright © 2021 Computer. All rights reserved.
//

import UIKit
import Firebase

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        DBCategory().getAllCategory(){
            data in
            let comic = ComicCrawData(arrayCategory: data)
            comic.addComic(link: "https://khotruyen.net/truyen-tranh/mad-summer-school", ID: "12345w67", poster: "ad")
        }

    }
    
}

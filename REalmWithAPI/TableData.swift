//
//  TableData.swift
//  StorageRealMUsing
//
//  Created by kireeti on 25/02/19.
//  Copyright © 2019 KireetiSoftSolutions. All rights reserved.
//

import UIKit
import RealmSwift



class TableData: Object {
    
    
    @objc dynamic var name: String? = ""
    @objc dynamic var subcatname : String? = ""
    @objc dynamic var done = false
    
    
    convenience init(dict: [String: Any]) {
        self.init()
        self.name  = (dict["category_id"] as? String)
        self.subcatname  = (dict["subcatname"] as? String)
    }
   
    
    
}


//
//  Type.swift
//  Rokk3rLabs Test
//
//  Created by Santiago Avila on 2/12/16.
//  Copyright © 2016 test. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class ClothingType: Object {
    dynamic var name: String = ""
    
    convenience init(name: String) {
        self.init()
        self.name = name
    }
}

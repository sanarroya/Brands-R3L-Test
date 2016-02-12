//
//  Validator.swift
//  Rokk3rLabs Test
//
//  Created by Santiago Avila on 2/12/16.
//  Copyright © 2016 test. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class Validator {
    
    static let sharedInstance = Validator()
    var brands: Results<Brand>?
    var clothingTypes: Results<ClothingType>?
    
    func isAppFirstLaunch() -> Bool {
        let isNotFirstLaunch = NSUserDefaults.standardUserDefaults().boolForKey("NotFirstLaunch")
        if (isNotFirstLaunch) {
            return false
        }else {
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "NotFirstLaunch")
            return true
        }
    }
    
    func findWorldInRealm(word word: String) -> EntitieType {
        if((brands!.filter("name = '" + word + "'").first) != nil) {
            return .Brand
        }else if((clothingTypes!.filter("name = '" + word + "'").first) != nil){
            return .ClothingType
        }else {
            return .Neither
        }
    }
    
    func stringIsEmpty(string: String) -> Bool {
        if(string.isEmpty) {
            return true
        }else {
            return false
        }
    }
}
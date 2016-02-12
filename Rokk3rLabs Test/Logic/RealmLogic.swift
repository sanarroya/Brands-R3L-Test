//
//  RealmLogic.swift
//  Rokk3rLabs Test
//
//  Created by Santiago Avila on 2/12/16.
//  Copyright © 2016 test. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class RealmLogic {
    
    static let brandsArray = ["Gap", "Banana Republic", "Boss", "Hugo Boss", "Taylor", "Rebecca Taylor"]
    static let clothingTypesArray = ["Denim", "Pants", "Sweaters", "Skirts", "Dresses"]
//    var brands: Results<Brand>?
//    static var clothingTypes: Results<ClothingType>
    
    class func loadBrandsAndClothingTypesInRealm() {
        let realm = try! Realm()
        realm.beginWrite()
        
        for brandName in brandsArray{
            let brand = Brand(name: brandName)
            realm.add(brand)
        }
        
        for clothingTypeName in clothingTypesArray {
            let clothingType = ClothingType(name: clothingTypeName)
            realm.add(clothingType)
        }
        try! realm.commitWrite()
    }
    
    class func getBrandsFromRealm() -> Results<Brand> {
        let realm = try! Realm()
        return realm.objects(Brand)
    }
    
    class func getClothingTypesFromRealm() -> Results<ClothingType> {
        let realm = try! Realm()
        return realm.objects(ClothingType)
    }
}
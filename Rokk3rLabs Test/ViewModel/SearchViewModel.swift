//
//  SearchViewModel.swift
//  Rokk3rLabs Test
//
//  Created by URpin on 2/12/16.
//  Copyright © 2016 test. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class SearchViewModel {
    
    func searchParts(var searchTerm searchTerm: String) -> Dictionary<String, Array<String>> {
        var searchPartsClassified = Dictionary<String, Array<String>>()
        var brandsFound = Array<String>()
        var clothingTypesFound = Array<String>()
        var resultQuery = Array<String>()
        
        if(Validator.sharedInstance.stringHasSpecialSubString(searchTerm)) {
            searchTerm = searchTerm.stringByReplacingOccurrencesOfString(Validator.sharedInstance.brandSpecialCase, withString: "")
            brandsFound.append(Validator.sharedInstance.brandSpecialCase)
        }
        let searchtermArray = searchTerm.characters.split{ $0 == " "}.map(String.init)
        let searchSet = Set<String>(searchtermArray)
        let finaltermsArray = Array(searchSet)
        
        for word in finaltermsArray {
            let resultType = Validator.sharedInstance.findWorldInRealm(word: word)
            
            switch(resultType) {
            case .Brand:
                brandsFound.append(word)
                continue
            case .ClothingType:
                clothingTypesFound.append(word)
                break
            case .Neither:
                resultQuery.append(word)
            }
        }
        
        searchPartsClassified["Brand"] = brandsFound
        searchPartsClassified["Clothing Type"] = clothingTypesFound
        searchPartsClassified["Result Query"] = resultQuery
        print(searchPartsClassified)
        return searchPartsClassified
    }

}
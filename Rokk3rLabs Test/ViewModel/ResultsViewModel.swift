//
//  ResultsViewModel.swift
//  Rokk3rLabs Test
//
//  Created by URpin on 2/12/16.
//  Copyright © 2016 test. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class ResultsViewModel {
    
    var tableDataSource: Dictionary<String, Array<String>>?
    let sections = ["Brand", "Clothing Type", "Result Query"]
}
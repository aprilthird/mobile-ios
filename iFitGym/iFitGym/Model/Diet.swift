//
//  Diet.swift
//  iFitGym
//
//  Created by Miguel on 11/19/17.
//  Copyright © 2017 Luis Jeffrey Rojas Montes. All rights reserved.
//

import Foundation
import SwiftyJSON

class Diet {
    var dietId: Int
    var totalCalories: Float
    
    
    init() {
        dietId = 0
        totalCalories = 0.0
        
    }
    
    init (from jsonObject: JSON) {
        dietId = jsonObject["dietId"].intValue
        totalCalories = jsonObject["totalCalories"].floatValue
    }
    
    static func from(jsonObjects: [JSON]) -> [Diet] {
        var diets: [Diet] = []
        let count = jsonObjects.count
        for i in 0...count - 1 {
            diets.append(Diet.init(from: jsonObjects[i]))
        }
        return diets
    }
}

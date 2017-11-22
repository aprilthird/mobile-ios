//
//  TypeMeal.swift
//  iFitGym
//
//  Created by Miguel on 11/19/17.
//  Copyright © 2017 Luis Jeffrey Rojas Montes. All rights reserved.
//

import Foundation
import SwiftyJSON


class TypeMeal {
    var typeMealId: Int
    var description: String
    
    
    
    init() {
        typeMealId = 0
        description = ""
        
    }
    
    init (from jsonObject: JSON) {
        typeMealId = jsonObject["TypeMealId"].intValue
        description = jsonObject["description"].stringValue
    }
    
    static func from(jsonObjects: [JSON]) -> [TypeMeal] {
        var typeMeals: [TypeMeal] = []
        let count = jsonObjects.count
        for i in 0...count - 1 {
            typeMeals.append(TypeMeal.init(from: jsonObjects[i]))
        }
        return typeMeals
    }
    
}

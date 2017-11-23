//
//  Food.swift
//  iFitGym
//
//  Created by Miguel on 11/19/17.
//  Copyright © 2017 Luis Jeffrey Rojas Montes. All rights reserved.
//


import Foundation
import SwiftyJSON


class Food {
    var foodId: Int
    var diet: Diet?
    var nameFood: String
    var typeMeal: TypeMeal?
    var quantity: Int
    var qMeasurement: QMeasurement?
    var description: String
    var calories: Float
    
    
    init() {
        foodId = 0
        diet = nil
        nameFood = ""
        typeMeal = nil
        quantity = 0
        qMeasurement = nil
        description = ""
        calories = 0.0
        
    }
    
    init (from jsonObject: JSON, withDiet diet: Diet, withTypeMeal typeMeal: TypeMeal, withQMeasurement qMeasurement: QMeasurement) {
        foodId = jsonObject["foodId"].intValue
        self.diet = diet
        nameFood = jsonObject["nameFood"].stringValue
        self.typeMeal = typeMeal
        quantity = jsonObject["quantity"].intValue
        self.qMeasurement = qMeasurement
        description = jsonObject["description"].stringValue
        calories = jsonObject["calories"].floatValue
    }
    
    static func from(jsonObjects: [JSON],  withDiet diet: Diet, withTypeMeal typeMeal: TypeMeal, withQMeasurement qMeasurement: QMeasurement) -> [Food] {
        var foods: [Food] = []
        let count = jsonObjects.count
        for i in 0...count - 1 {
            foods.append(Food.init(from: jsonObjects[i], withDiet: diet, withTypeMeal:typeMeal, withQMeasurement: qMeasurement))
        }
        return foods
    }
    
}

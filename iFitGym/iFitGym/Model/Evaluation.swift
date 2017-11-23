//
//  Evaluation.swift
//  iFitGym
//
//  Created by Miguel on 11/19/17.
//  Copyright © 2017 Luis Jeffrey Rojas Montes. All rights reserved.
//

import Foundation
import SwiftyJSON


class Evaluation {
    var evaluationId: Int
    var currentDate: Date
    var comment: String
    var activity: Activity?
    var diet: Diet?
    
    init() {
        evaluationId = 0
        currentDate = Date()
        comment = ""
        activity = nil
        diet = nil
    }
    
    init (from jsonObject: JSON, withActivity activity:Activity, withDiet diet:Diet) {
        evaluationId = jsonObject["evaluationId"].intValue
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        currentDate = formatter.date(from: jsonObject["currentDate"].stringValue)!
        comment = jsonObject["comment"].stringValue
        self.activity = activity
        self.diet = diet
    }
    
    static func from(jsonObjects: [JSON],withActivity activity:Activity, withDiet diet:Diet) -> [Evaluation] {
        var evaluations: [Evaluation] = []
        let count = jsonObjects.count
        for i in 0...count - 1 {
            evaluations.append(Evaluation.init(from: jsonObjects[i], withActivity: activity, withDiet: diet))
        }
        return evaluations
    }
    
}

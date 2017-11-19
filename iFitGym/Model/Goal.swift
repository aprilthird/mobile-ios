//
//  Goal.swift
//  iFitGym
//
//  Created by Miguel on 11/19/17.
//  Copyright © 2017 Luis Jeffrey Rojas Montes. All rights reserved.
//

import Foundation
import SwiftyJSON

class Goal {
    var goalId: Int
    var description: String
    var endDate: Date
    var arms: Float
    var legs: Float
    var abs: Float
    var back: Float
    var chest: Float
    var weight: Float
    var status: String
    var client: Client?
    var startDate: Date
    
    
    init() {
        goalId = 0
        description = ""
        startDate = Date()
        endDate = Date()
        arms = 0.0
        legs = 0.0
        abs = 0.0
        back = 0.0
        chest = 0.0
        weight = 0.0
        status = ""
        client = nil
        
    }
    
    init (from jsonObject: JSON, withClient client: Client) {
        goalId = jsonObject["goalId"].intValue
        description = jsonObject["description"].stringValue
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        startDate = formatter.date(from: jsonObject["startDate"].stringValue)!
        endDate = formatter.date(from: jsonObject["endDate"].stringValue)!
        arms = jsonObject["arms"].floatValue
        legs = jsonObject["legs"].floatValue
        abs = jsonObject["abs"].floatValue
        back = jsonObject["back"].floatValue
        chest = jsonObject["chest"].floatValue
        weight = jsonObject["weight"].floatValue
        status = jsonObject["status"].stringValue
        self.client = client
    }
    
    static func from(jsonObjects: [JSON],  withClient client: Client) -> [Goal] {
        var goals: [Goal] = []
        let count = jsonObjects.count
        for i in 0...count - 1 {
            goals.append(Goal.init(from: jsonObjects[i], withClient: client))
        }
        return goals
    }
    
}

//
//  ActivityType.swift
//  iFitGym
//
//  Created by Luis Jeffrey Rojas Montes on 11/16/17.
//  Copyright © 2017 Luis Jeffrey Rojas Montes. All rights reserved.
//

import Foundation
import SwiftyJSON


class ActivityType {
    var activityTypeId: Int
    var gymCompany: GymCompany?
    var status: String
    var description: String
    
    
    init() {
        activityTypeId = 0
        gymCompany = nil
        status = ""
        description = ""
        
    }
    
    init (from jsonObject: JSON, withGymCompany gymCompany: GymCompany) {
        activityTypeId = jsonObject["activityTypeId"].intValue
        self.gymCompany = gymCompany
        status = jsonObject["status"].stringValue
        description = jsonObject["description"].stringValue
    }
    
    static func from(jsonObjects: [JSON], withGymCompany gymCompany: GymCompany) -> [ActivityType] {
        var activitytypes: [ActivityType] = []
        let count = jsonObjects.count
        for i in 0...count - 1 {
            activitytypes.append(ActivityType.init(from: jsonObjects[i], withGymCompany: gymCompany))
        }
        return activitytypes
    }
    
}

//
//  ActivityType.swift
//  iFitGym
//
//  Created by Luis Jeffrey Rojas Montes on 11/16/17.
//  Copyright © 2017 Luis Jeffrey Rojas Montes. All rights reserved.
//

import Foundation
<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> c959759c6f7c352518020cc80054d8c8f2df0dda
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
<<<<<<< HEAD
=======
=======
>>>>>>> 96fa2428621ab81154f6d013e0db79164d67dac6
>>>>>>> c959759c6f7c352518020cc80054d8c8f2df0dda

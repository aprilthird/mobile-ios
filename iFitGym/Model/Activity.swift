//
//  Activity.swift
//  iFitGym
//
//  Created by Miguel on 11/19/17.
//  Copyright © 2017 Luis Jeffrey Rojas Montes. All rights reserved.
//

import Foundation
import SwiftyJSON


class Activity {
    var activityId: Int
    var client: Client?
    var startTime: Date
    var status: String
    var establishment: Establishment?
    var endTime: Date
    
    
    init() {
        activityId = 0
        client = nil
        startTime = Date()
        endTime = Date()
        status = ""
        establishment = nil
        
        
    }
    
    init (from jsonObject: JSON, withClient client: Client, withEstablishment establishment: Establishment) {
        activityId = jsonObject["activityId"].intValue
        self.client = client
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        startTime = formatter.date(from: jsonObject["startTime"].stringValue)!
        endTime = formatter.date(from: jsonObject["endTime"].stringValue)!
        status = jsonObject["status"].stringValue
        self.establishment = establishment
    }
    
    static func from(jsonObjects: [JSON],  withClient client: Client, withEstablishment establishment: Establishment) -> [Activity] {
        var activities: [Activity] = []
        let count = jsonObjects.count
        for i in 0...count - 1 {
            activities.append(Activity.init(from: jsonObjects[i], withClient: client, withEstablishment: establishment))
        }
        return activities
    }
    
}

//
//  ActivityDetail.swift
//  iFitGym
//
//  Created by Miguel on 11/19/17.
//  Copyright © 2017 Luis Jeffrey Rojas Montes. All rights reserved.
//

import Foundation
import Foundation
import SwiftyJSON


class ActivityDetail {
    var activityDetailId: Int
    var activity: Activity?
    var qRepetition: Int
    var activityType: ActivityType?
    
    
    init() {
        activityDetailId = 0
        activity = nil
        qRepetition = 0
        activityType = nil
        
        
    }
    
    init (from jsonObject: JSON, withActivityType activityType: ActivityType,  withActivity activity: Activity) {
        activityDetailId = jsonObject["activityDetailId"].intValue
        self.activity = activity
        qRepetition = jsonObject["qRepetition"].intValue
        self.activityType = activityType
    }
    
    static func from(jsonObjects: [JSON], withActivityType activityType: ActivityType,  withActivity activity: Activity) -> [ActivityDetail] {
        var activityDetails: [ActivityDetail] = []
        let count = jsonObjects.count
        for i in 0...count - 1 {
            activityDetails.append(ActivityDetail.init(from: jsonObjects[i], withActivityType: activityType,
                                                       withActivity: activity))
        }
        return activityDetails
    }
    
}

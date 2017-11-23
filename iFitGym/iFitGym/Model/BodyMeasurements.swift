//
//  BodyMeasurements.swift
//  iFitGym
//
//  Created by Miguel on 11/19/17.
//  Copyright © 2017 Luis Jeffrey Rojas Montes. All rights reserved.
//

import Foundation

import Foundation
import SwiftyJSON

class BodyMeasurements {
    var bodyMeasurementsId: Int
    var arms: Float
    var legs: Float
    var back: Float
    var abs: Float
    var chest: Float
    var weight: Float
    var evaluation: Evaluation?
    var client: Client?
    
    
    init() {
        bodyMeasurementsId = 0
        arms = 0.0
        legs = 0.0
        abs = 0.0
        back = 0.0
        chest = 0.0
        weight = 0.0
        evaluation = nil
        client = nil
        
    }
    
    init (from jsonObject: JSON, withEvaluation evaluation: Evaluation, withClient client: Client) {
        bodyMeasurementsId = jsonObject["bodyMeasurementsId"].intValue
        arms = jsonObject["arms"].floatValue
        legs = jsonObject["legs"].floatValue
        abs = jsonObject["abs"].floatValue
        back = jsonObject["back"].floatValue
        chest = jsonObject["chest"].floatValue
        weight = jsonObject["weight"].floatValue
        self.evaluation = evaluation
        self.client = client 
        }
        
        static func from(jsonObjects: [JSON], withEvaluation evaluation: Evaluation, withClient client: Client) -> [BodyMeasurements] {
        var bodymeasurements: [BodyMeasurements] = []
        let count = jsonObjects.count
        for i in 0...count - 1 {
            bodymeasurements.append(BodyMeasurements.init(from: jsonObjects[i],withEvaluation: evaluation ,withClient: client))
        }
        return bodymeasurements
        }
}



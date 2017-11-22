//
//  QMeasurement.swift
//  iFitGym
//
//  Created by Miguel on 11/19/17.
//  Copyright © 2017 Luis Jeffrey Rojas Montes. All rights reserved.
//

import Foundation
import SwiftyJSON


class QMeasurement {
    var qMeasurementId: Int
    var description: String
    
    init() {
        qMeasurementId = 0
        description = ""
        
    }
    
    init (from jsonObject: JSON) {
        qMeasurementId = jsonObject["qMeasurementId"].intValue
        description = jsonObject["description"].stringValue
    }
    
    static func from(jsonObjects: [JSON]) -> [QMeasurement] {
        var qMeasurements: [QMeasurement] = []
        let count = jsonObjects.count
        for i in 0...count - 1 {
            qMeasurements.append(QMeasurement.init(from: jsonObjects[i]))
        }
        return qMeasurements
    }
    
}

//
//  SubscriptionType.swift
//  iFitGym
//
//  Created by Miguel on 11/19/17.
//  Copyright © 2017 Luis Jeffrey Rojas Montes. All rights reserved.
//

import Foundation
import SwiftyJSON

class SuscriptionType {
    var suscriptionTypeId: Int
    var description: String
    var price: Float
    var qpTrainers: Int
    var qClients: Int
    var status: String
    var qEstablishments: Int
    
    
    init() {
        suscriptionTypeId = 0
        description = ""
        price = 0.0
        qpTrainers = 0
        qClients = 0
        status = ""
        qEstablishments = 0
        
    }
    
    init (from jsonObject: JSON) {
        suscriptionTypeId = jsonObject["suscriptionTypeId"].intValue
        description = jsonObject["description"].stringValue
        price = jsonObject["price"].floatValue
        qpTrainers = jsonObject["qpTrainers"].intValue
        qClients = jsonObject["qClients"].intValue
        status = jsonObject["status"].stringValue
        qEstablishments = jsonObject["qEstablishments"].intValue
    }
    
    static func from(jsonObjects: [JSON]) -> [SuscriptionType] {
        var suscriptionTypes: [SuscriptionType] = []
        let count = jsonObjects.count
        for i in 0...count - 1 {
            suscriptionTypes.append(SuscriptionType.init(from: jsonObjects[i]))
        }
        return suscriptionTypes
    }
    
}

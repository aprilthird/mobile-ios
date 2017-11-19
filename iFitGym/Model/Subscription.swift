//
//  Subscription.swift
//  iFitGym
//
//  Created by Miguel on 11/19/17.
//  Copyright © 2017 Luis Jeffrey Rojas Montes. All rights reserved.
//

import Foundation
import SwiftyJSON


class Suscription {
    var suscriptionId: Int
    var suscriptionType: SuscriptionType
    var gymCompany: GymCompany
    var qMonths: Int
    var status: String
    var startDate: Date
    
    
    init() {
        suscriptionId = 0
        suscriptionType = SuscriptionType()
        gymCompany = GymCompany()
        qMonths = 0
        status = ""
        startDate = Date()
        
    }
    
    init (from jsonObject: JSON, witSuscriptionType suscriptionType: SuscriptionType, withGymCompany gymCompany: GymCompany) {
        suscriptionId = jsonObject["suscriptionId"].intValue
        self.suscriptionType = suscriptionType
        self.gymCompany = gymCompany
        qMonths = jsonObject["qMonths"].intValue
        status = jsonObject["status"].stringValue
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        startDate = formatter.date(from: jsonObject["startDate"].stringValue)!
    }
    
    static func from(jsonObjects: [JSON],witSuscriptionType suscriptionType: SuscriptionType, withGymCompany gymCompany: GymCompany) -> [Suscription] {
        var suscriptions: [Suscription] = []
        let count = jsonObjects.count
        for i in 0...count - 1 {
            suscriptions.append(Suscription.init(from: jsonObjects[i], witSuscriptionType: suscriptionType, withGymCompany: gymCompany))
        }
        return suscriptions
    }
    
}

//
//  Establishment.swift
//  iFitGym
//
//  Created by Luis Jeffrey Rojas Montes on 11/16/17.
//  Copyright © 2017 Luis Jeffrey Rojas Montes. All rights reserved.
//

import Foundation
import SwiftyJSON
import AlamofireImage

class Establishment {
    var establishmentId: Int
    var name: String
    var status: String
    var gymCompany: GymCompany?
    var locationX: Float
    var locationY: Float
    
    
    init() {
        establishmentId = 0
        name = ""
        status = ""
        gymCompany = nil
        locationX = 0.0
        locationY = 0.0
    }
    
    init (from jsonObject: JSON, withGymCompany gymCompany: GymCompany) {
        establishmentId = jsonObject["establishmentId"].intValue
        name = jsonObject["name"].stringValue
        status = jsonObject["status"].stringValue
        self.gymCompany = gymCompany
        locationX = jsonObject["locationX"].floatValue
        locationY = jsonObject["locationY"].floatValue
        
    }
    
    static func from(jsonObjects: [JSON], withGymCompany gymCompany: GymCompany) -> [Establishment] {
        var establishments: [Establishment] = []
        let count = jsonObjects.count
        for i in 0...count - 1 {
            establishments.append(Establishment.init(from: jsonObjects[i], withGymCompany: gymCompany))
        }
        return establishments
    }
    
}



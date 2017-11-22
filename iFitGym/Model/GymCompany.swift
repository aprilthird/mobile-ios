//
//  GymCompany.swift
//  iFitGym
//
//  Created by Luis Jeffrey Rojas Montes on 11/16/17.
//  Copyright © 2017 Luis Jeffrey Rojas Montes. All rights reserved.
//

import Foundation
import SwiftyJSON

class GymCompany {
    var gymCompanyId: Int
    var name: String
    var username: String
    var phoneNumber: String
    var password: String
    var urlLogo: String
    var createdAt: String
    var updatedAt: String
    
    init() {
        gymCompanyId = 0
        name = ""
        username = ""
        password = ""
        phoneNumber = ""
        urlLogo = ""
        createdAt = ""
        updatedAt = ""
    }
    
    init(from jsonObject: JSON) {
        gymCompanyId = jsonObject["id"].intValue
        name = jsonObject["name"].stringValue
        username = jsonObject["username"].stringValue
        password = ""
        phoneNumber = jsonObject["phoneNumber"].stringValue
        urlLogo = jsonObject["urlLogo"].stringValue
        createdAt = jsonObject["createdAt"].stringValue
        updatedAt = jsonObject["updatedAt"].stringValue
    }
    
    static func from(jsonObjects: [JSON]) -> [GymCompany] {
        var gymCompanies: [GymCompany] = []
        let count = jsonObjects.count
        for i in 0...count - 1 {
            gymCompanies.append(GymCompany.init(from: jsonObjects[i]))
        }
        return gymCompanies
    }
}

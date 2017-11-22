//
//  PersonalTrainer.swift
//  iFitGym
//
//  Created by Luis Jeffrey Rojas Montes on 11/16/17.
//  Copyright © 2017 Luis Jeffrey Rojas Montes. All rights reserved.
//

import Foundation
import SwiftyJSON

class PersonalTrainer {
    var personalTrainerId: Int
    var firstName: String
    var lastName: String
    var username: String
    var password: String
    var phoneNumber: String
    var address: String
    var birthDate: Date
    var gender: String
    var photoUrl: String
    var createdAt: Date
    var updatedAt: String
    
    init() {
        personalTrainerId = 0
        firstName = ""
        lastName = ""
        username = ""
        password = ""
        phoneNumber = ""
        address = ""
        birthDate = Date()
        gender = ""
        photoUrl = ""
        createdAt = Date()
        updatedAt = ""
    }
    
    init (from jsonObject: JSON) {
        personalTrainerId = jsonObject["personalTrainerId"].intValue
        firstName = jsonObject["firstName"].stringValue
        lastName = jsonObject["lastName"].stringValue
        username = jsonObject["username"].stringValue
        password = ""
        phoneNumber = jsonObject["phoneNumber"].stringValue
        address = jsonObject["address"].stringValue
        gender = jsonObject["gender"].stringValue
        let birthDateString = jsonObject["birthDate"].stringValue
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        birthDate = formatter.date(from: birthDateString)!
        createdAt = formatter.date(from: jsonObject["createdAt"].stringValue)!
        updatedAt = jsonObject["updatedAt"].stringValue
        photoUrl = jsonObject["photoUrl"].stringValue
    }
    
    static func from(jsonObjects: [JSON]) -> [PersonalTrainer] {
        var personalTrainers: [PersonalTrainer] = []
        let count = jsonObjects.count
        for i in 0...count - 1 {
            personalTrainers.append(PersonalTrainer.init(from: jsonObjects[i]))
        }
        return personalTrainers
    }
}

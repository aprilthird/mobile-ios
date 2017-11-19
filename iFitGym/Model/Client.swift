//
//  Client.swift
//  iFitGym
//
//  Created by Luis Jeffrey Rojas Montes on 11/16/17.
//  Copyright © 2017 Luis Jeffrey Rojas Montes. All rights reserved.
//

import Foundation
import SwiftyJSON
import AlamofireImage

class Client{
    var clientId: Int
    var firstName: String
    var lastName: String
    var email: String
    var username: String
    var address: String
    var password: String
    var gender: String
    var photoUrl: String
    var birthDate: Date
    var height: Float
    var pTrainer: PersonalTrainer?
    var createdAt: Date
    var updatedAt: Date
    
    
    init(){
        
        clientId = 0
        firstName = ""
        lastName = ""
        email = ""
        username = ""
        address = ""
        password = ""
        gender = ""
        photoUrl = ""
        birthDate = Date()
        height = 0.0
        pTrainer = nil
        createdAt = Date()
        updatedAt = Date()
        
    }
    
    init (from jsonObject: JSON, withTrainer pTrainer: PersonalTrainer ) {
        
        clientId = jsonObject["clientId"].intValue
        firstName = jsonObject["firstName"].stringValue
        lastName = jsonObject["lastName"].stringValue
        email = jsonObject["email"].stringValue
        username = jsonObject["username"].stringValue
        address = jsonObject["address"].stringValue
        password = ""
        gender = jsonObject["gender"].stringValue
        photoUrl = jsonObject["photoUrl"].stringValue
        let birthDateString = jsonObject["birthDate"].stringValue
        height = jsonObject["height"].floatValue
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        birthDate = formatter.date(from: birthDateString)!
        createdAt = formatter.date(from: jsonObject["createdAt"].stringValue)!
        updatedAt = formatter.date(from: jsonObject["updatedAt"].stringValue)!
        self.pTrainer = pTrainer
        
    }
    
    static func from(jsonObjects: [JSON], withTrainer pTrainer: PersonalTrainer) -> [Client] {
        var clients: [Client] = []
        let count = jsonObjects.count
        for i in 0...count - 1 {
            clients.append(Client.init(from: jsonObjects[i], withTrainer: pTrainer))
        }
        return clients
    }
     
}


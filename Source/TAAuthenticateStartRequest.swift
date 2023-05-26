//
//  TAAuthenticateStartRequest.swift
//  MFAuthAccess_Example
//
//  Created by Nishu Sharma on 17/05/23.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import Foundation
import ObjectMapper

//
//{
//  "model": {
//    "authSessionId": "9e79c1b2-115f-4035-8411-f567cfc62def",
//    "email": "string",
//    "userName": "string",
//    "password": "string",
//    "phoneNumber": "919588693009",
//    "pin": "string",
//    "authFactorType": 3,
//    "currentAuthStep": 4
//  }
//}



class TAAuthenticateRequest : Mappable
{
    var model : TAAuthenticateRequestModelObj!
    init() {}
    required init?(map: Map) {}
    func mapping(map: Map)
    {
        model   <- map["model"]
    }
    
}

class TAAuthenticateRequestModelObj : Mappable
{
    var authSessionId : String = ""
    var email : String = ""
    var userName : String = ""
    var password : String = ""
    var phoneNumber : String = ""
    var pin : String = ""
    var authFactorType : Int = -1
    var currentAuthStep : Int = -1
    
   
    init() {}
    required init?(map: Map) {}
    func mapping(map: Map)
    {
        authSessionId            <- map["authSessionId"]
        email                    <- map["email"]
        userName                 <- map["userName"]
        password                 <- map["password"]
        phoneNumber              <- map["phoneNumber"]
        pin                      <- map["pin"]
        authFactorType           <- map["authFactorType"]
        currentAuthStep          <- map["currentAuthStep"]
        
        
    }
    
}

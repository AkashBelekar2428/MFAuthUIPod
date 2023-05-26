//
//  TAAuthenticateRequest.swift
//  MFAuthAccess_Example
//
//  Created by Nishu Sharma on 17/05/23.
//  Copyright © 2023 CocoaPods. All rights reserved.
//


//{
//  "model": {
//    "clientId": "7f627b8a-d174-4679-bb37-4414afd34ee2",
//    "clientScope": "ottr-api"
//  }
//}


import Foundation
import ObjectMapper


class TAAuthenticateStartRequest : Mappable
{
    var model : TAAuthenticateStartModelObj!
    init() {}
    required init?(map: Map) {}
    func mapping(map: Map)
    {
        model   <- map["model"]
    }
    
}

class TAAuthenticateStartModelObj : Mappable
{
    var clientId : String = ""
    var clientScope : String = ""
   
    init() {}
    required init?(map: Map) {}
    func mapping(map: Map)
    {
        clientId          <- map["clientId"]
        clientScope       <- map["clientScope"]
    }
    
}

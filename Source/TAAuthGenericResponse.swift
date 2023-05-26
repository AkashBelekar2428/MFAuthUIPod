//
//  TAAuthGenericResponse.swift
//  MFAuthAccess_Example
//
//  Created by Nishu Sharma on 17/05/23.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import Foundation
import ObjectMapper

// MARK: Configure Enums


//    VERIFY_USERNAME_PASSWORD = 1,
//    VERIFY_EMAIL_PASSWORD = 2,
//    VERIFY_PASSWORD = 3,
//    VERIFIY_PHONENUMBER = 4,
//    VERIFY_PIN = 5,
//    VERIFY_EMAIL = 6,
//    AUTH_COMPLETE = 99


//    USERNAME_PASSWORD = 1,
//    EMAIL_PASSWORD =2,
//    MOBILE_PIN = 3,
//    EMAIL_PIN = 4

enum TAAuthFactorType {
    case USERNAME_PASSWORD
    case EMAIL_PASSWORD
    case MOBILE_PIN
    case EMAIL_PIN
    case SIXDIGITPIN
    case NONE
}

enum TAAuthFactorNextStep {
    case VERIFY_USERNAME_PASSWORD
    case VERIFY_EMAIL_PASSWORD
    case VERIFY_PASSWORD
    case VERIFIY_PHONENUMBER
    case VERIFY_PIN
    case VERIFY_EMAIL
    case AUTH_COMPLETE
    case NONE
}



// MARK: Generic Response Model
class TAAuthGenericResponse : Mappable
{
    var data : TAAuthGenericResponseDataObj!
    var isError : Bool = false
    var errorMessage : String = ""
    var errorCode : String = ""
    var errors : [String] = []
    var validationErrors : [TAAuthGenericResponseValidationErrorsObj]!
    
    init() {}
    required init?(map: Map) {}
    func mapping(map: Map)
    {
        data                    <- map["data"]
        isError                 <- map["isError"]
        errorMessage            <- map["errorMessage"]
        errorCode               <- map["errorCode"]
        errors                  <- map["errors"]
        validationErrors        <- map["validationErrors"]
    }
    
}

// MARK: Data Response Model
class TAAuthGenericResponseDataObj : Mappable
{
    var sessionId : String = ""
    var nextStep : Int = -1
    var token : TAAuthGenericResponseTokenObj!
    var nextAuthFactor : Int = -1
    var pendingRetryCount : Int = -1
    var resendPinAfter : Int = -1
    var nextStepEnum : TAAuthFactorNextStep = .NONE
    var authType : TAAuthFactorType = .NONE
    var componentType : TAAuthFactorType = .NONE

   
    init() {}
    required init?(map: Map) {}
    func mapping(map: Map)
    {
        sessionId                       <- map["sessionId"]
        nextStep                        <- map["nextStep"]
        token                           <- map["token"]
        nextAuthFactor                  <- map["nextAuthFactor"]
        pendingRetryCount               <- map["pendingRetryCount"]
        resendPinAfter                  <- map["resendPinAfter"]
    }
    
}

// MARK: Validation Errors Model
class TAAuthGenericResponseTokenObj : Mappable
{
    var token : String = ""
    var tokenExpiry : String = ""
   
    init() {}
    required init?(map: Map) {}
    func mapping(map: Map)
    {
        token                       <- map["token"]
        tokenExpiry                 <- map["tokenExpiry"]
    }
    
}
// MARK: Validation Errors Model
class TAAuthGenericResponseValidationErrorsObj : Mappable
{
    var propertyName : String = ""
    var errorMessage : String = ""
   
    init() {}
    required init?(map: Map) {}
    func mapping(map: Map)
    {
        propertyName                 <- map["propertyName"]
        errorMessage                 <- map["errorMessage"]
    }
    
}

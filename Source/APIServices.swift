//
//  APIServices.swift
//  Zira
//
//  Created by Nishu Sharma on 19/10/21.
//

import Foundation

class APIServices: WsHelperProtocol
{
    func GetSessionIdForAuthetication(api: String, requestModel: TAAuthenticateStartRequest, completionHandler: @escaping (GeneralRespModel?) -> Void)
    {
        WSHelper.sharedInstance.GetSessionIdForAuthetication(api: api, requestModel: requestModel, completion: { respObj in
            switch respObj
            {
            case .success(let data):
                if let Resp = data as? TAAuthGenericResponse {
                    let genObj = GeneralRespModel(status: true, respObj: Resp, message: "", etype: errorType.none)
                    completionHandler(.some(genObj))
                }
            case .failure(let etype, let msg):
                let genObj = GeneralRespModel(status: false, respObj: nil, message: msg, etype: etype)
                completionHandler(.some(genObj))
            case .sessionTimeOut(_):
                let genObj = GeneralRespModel(status: false, respObj: nil, message: "Session time out !!", etype: .sessionTimeOut)
                completionHandler(.some(genObj))
            }
        })
        
    }
    
    func Authenticate(api: String, requestModel: TAAuthenticateRequest, completionHandler: @escaping (GeneralRespModel?) -> Void)
    {
        WSHelper.sharedInstance.Authenticate(api: api, requestModel: requestModel, completion: { respObj in
            switch respObj
            {
            case .success(let data):
                if let Resp = data as? TAAuthGenericResponse {
                    let genObj = GeneralRespModel(status: true, respObj: Resp, message: "", etype: errorType.none)
                    completionHandler(.some(genObj))
                }
            case .failure(let etype, let msg):
                let genObj = GeneralRespModel(status: false, respObj: nil, message: msg, etype: etype)
                completionHandler(.some(genObj))
            case .sessionTimeOut(_):
                let genObj = GeneralRespModel(status: false, respObj: nil, message: "Session time out !!", etype: .sessionTimeOut)
                completionHandler(.some(genObj))
            }
        })
        
        
    }
    

    
}

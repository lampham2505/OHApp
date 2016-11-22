//
//  APIHelper.swift
//  OneHealthApp
//
//  Created by Viet Anh on 11/17/16.
//  Copyright © 2016 OneHealth. All rights reserved.
//
import UIKit

class APIHelper: NSObject {
    static func processDataResponseOnlyMessage(data:Data,urlresponse:URLResponse?,error:NSError?,keyList:String,complete:@escaping(_ json:NSDictionary?,_ error:APIError?)->()){
        let httpResponse:HTTPURLResponse? = urlresponse as? HTTPURLResponse
        var _statusError:APIError? = nil
        if httpResponse != nil {
            if(((httpResponse?.statusCode)! < 200) || ((httpResponse?.statusCode)! > 208)){
                _statusError = APIError.init(reason: "HTTP Response Not OK", andCode: (httpResponse?.statusCode)!)
            }
        }
        if _statusError != nil{
            complete(nil, _statusError)
        }else{
            if error != nil {
                _statusError = APIError.init(reason: error?.localizedDescription, andCode: (error?.code)!)
                complete(nil, _statusError)
            }else{
                do{
                    print(data)
                    let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! [String:Any]
                    if json[key_status_error] as! Int == Int(status_code_success) {
                        if keyList == "" {
                            complete(json as NSDictionary?, nil)
                        }else{
                            complete(json[keyList] as! NSDictionary?,nil)
                        }
                    }else{
                        _statusError = APIError.init(reason: json[key_status_message] as! String!, andCode: Int(status_code_failed))
                        complete(nil, _statusError)
                    }
                }catch{
                    _statusError = APIError.init(reason: "fail json", andCode: Int(status_code_failed))
                    complete(nil, _statusError)
                }
                
                
            }
        }
    }
}

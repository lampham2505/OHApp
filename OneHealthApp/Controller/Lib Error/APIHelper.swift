//
//  APIHelper.swift
//  OneHealthApp
//
//  Created by Viet Anh on 11/17/16.
//  Copyright © 2016 OneHealth. All rights reserved.
//

import UIKit

class APIHelper: NSObject {
    func processDataResponse(data:Data?,urlresponse:URLResponse?,error:NSError?,complete:@escaping(_ json:NSDictionary?,_ error:APIError?)->()){
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
                let json = try? JSONSerialization.jsonObject(with: data!, options: []) as! NSDictionary
                if json?["EMStatusCode"] as! String == "1" {
                    complete(json, nil)
                }else{
                    _statusError = APIError.init(reason: "", andCode: 0)
                    complete(nil, _statusError)
                }
            }
        }
    }
}

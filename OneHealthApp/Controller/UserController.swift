//
//  UserController.swift
//  OneHealthApp
//
//  Created by Viet Anh on 11/16/16.
//  Copyright © 2016 OneHealth. All rights reserved.
//

import UIKit

class UserController: NSObject {
    var baseUrl:String!
    init(baseURL:String){
        baseUrl = baseURL
    }
    func APILoginUser(username: String,password:String, completion: @escaping (_ data: NSDictionary?,_ error:APIError?) -> ()) {
        var request = URLRequest(url: URL(string: "\(baseUrl!)LoginUser.php")!)
        request.httpMethod = "POST"
        let postString = "Mobile=\(username)&Password=\(password)"
        request.httpBody = postString.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            APIHelper.processDataResponse(data: data!, urlresponse: response, error: error as NSError?, complete: { (json, error) in
                completion(json, error)
            })
        }
        task.resume()
    }
    func APIRegisterUser(name: String, password: String, email: String,  mobile: String, completion: @escaping (_ data: NSDictionary?,_ error:APIError?) -> ()) {
        var request = URLRequest(url: URL(string: "\(baseUrl!)RegisterUser.php")!)
        request.httpMethod = "POST"
        let postString = "Name=\(name)&Password=\(password)&Email=\(email)&Mobile=\(mobile)"
        request.httpBody = postString.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            APIHelper.processDataResponse(data: data!, urlresponse: response, error: error as NSError?, complete: { (json, error) in
                completion(json, error)
            })
        }
        task.resume()
    }
    func APIActiveUser(passcode: Int, completion: @escaping (_ data: NSDictionary?,_ error:APIError?) -> ()) {
        var request = URLRequest(url: URL(string: "\(baseUrl!)isActive.php")!)
        request.httpMethod = "POST"
        let postString = "passcode=\(passcode)"
        request.httpBody = postString.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            APIHelper.processDataResponse(data: data!, urlresponse: response, error: error as NSError?, complete: { (json, error) in
                completion(json, error)
            })
        }
        task.resume()
    }
}

//
//  APIManager.swift
//  OneHealthApp
//
//  Created by Viet Anh on 11/4/16.
//  Copyright © 2016 OneHealth. All rights reserved.
//

import UIKit

class APIManager: NSObject {
    var baseUrl:String!
    static let sharedInstance:APIManager = {
        let instance = APIManager()
        instance.baseUrl = "http://localhost/webservice/"
        return instance
    }()
    func userBussiness() -> UserController{
        return UserController.init(baseURL: baseUrl)
    }
    func loginUser(username:String,password:String, completion: @escaping (_ user: User?,_ error:APIError?) -> ()){
        self.userBussiness().APILoginUser(username: username,password:password, completion:{ (data:NSDictionary?,error:APIError?) in
            DispatchQueue.main.async {
                if error == nil {
                    
                }else{
                    completion(nil, error)
                }
            }
        })
    }
    func parseUser(){
        
    }
}

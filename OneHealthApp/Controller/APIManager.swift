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
    func loginUser(username:String, password:String, completion: @escaping ( _ user: User?, _ error:APIError?) -> ()){
        self.userBussiness().APILoginUser(username: username,password:password, completion:{ (data:NSDictionary?,error:APIError?) in
            DispatchQueue.main.async {
                if error == nil {
                    if let _ = data{
                        completion(self.parseUser(data: data!),nil)
                    }
                }else{
                    completion(nil, error)
                }
            }
        })
    }
    func parseUser(data:NSDictionary)->User{
        let user:User = User.init()
        user.UserId = data["UserID"] as! String
        user.Token = data["Token"] as! String
        return user
    }
    func registerUser(name: String, password: String, email: String,  mobile: String, completion: @escaping (_ status:Int,_ error:APIError?) -> ()){
        self.userBussiness().APIRegisterUser(name: name, password: password, email: email, mobile: mobile, completion:{ (data:NSDictionary?,error:APIError?) in
            DispatchQueue.main.async {
                if error == nil {
                    completion(data?[key_status_error] as! Int, error)
                }else{
                    completion(Int(status_code_failed), error)
                }
            }
        })
    }
    func activeUser(userID: String,passcode: String, token: String, completion: @escaping (_ status:Int,_ error:APIError?) -> ()){
        self.userBussiness().APIActiveUser(userID: userID,passcode: passcode, token: token, completion:{ (data:NSDictionary?,error:APIError?) in
            DispatchQueue.main.async {
                if error == nil {
                    completion(data?[key_status_error] as! Int, error)
                }else{
                    completion(Int(status_code_failed), error)
                }
            }
        })
    }
    func readUser(userID: String, completion: @escaping (_ arr:NSMutableArray,_ error:APIError?) -> ()){
        self.userBussiness().APIReadUser(userID: userID) { (data:NSArray?,error:APIError?) in
            DispatchQueue.main.async {
                if error == nil {
                    print(data as Any)
                }else{
                    
                }
            }
        }
    }
    func updateUser(userID: String,name: String, fullName: String, mobile: String, email: String, dob: String, address: String, gender: String, introduction: String, location: String, completion: @escaping (_ status:Int,_ error:APIError?) -> ()){
        self.userBussiness().APIUpdateUser(userID: userID,name: name, fullName: fullName, mobile: mobile, email: email, dob: dob, address: address, gender: gender, introduction: introduction, location: location, completion:{ (data:NSDictionary?,error:APIError?) in
            DispatchQueue.main.async {
                if error == nil {
                    completion(data?[key_status_error] as! Int, error)
                }else{
                    completion(Int(status_code_failed), error)
                }
            }
        })
    }
}

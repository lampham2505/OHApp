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
    func APILoginUser(username: String,password:String, completion: @escaping ( _ data: NSDictionary?, _ error:APIError?) -> ()) {
        var request = URLRequest(url: URL(string: "\(baseUrl!)LoginUser.php")!)
        request.httpMethod = "POST"
        let postString = "Mobile=\(username)&Password=\(password)&Type=0&Email=0&HardwareID=0"
        request.httpBody = postString.data(using: .utf8)
        let urlconfig = URLSessionConfiguration.default
        urlconfig.timeoutIntervalForRequest = 60
        urlconfig.timeoutIntervalForResource = 60
        let task = URLSession(configuration: urlconfig).dataTask(with: request) { data, response, error in
            APIHelper.processDataResponseOnlyMessage(data: data, urlresponse: response as URLResponse?, error: error as NSError?,keyList:"", complete: { (json,error,arr) in
                completion(json, error)
            })
        }
        task.resume()
    }
    func APIRegisterUser(name: String, password: String, email: String,  mobile: String, completion: @escaping ( _ data: NSDictionary?, _ error:APIError?) -> ()) {
        var request = URLRequest(url: URL(string: "\(baseUrl!)RegisterUser.php")!)
        request.httpMethod = "POST"
        let postString = "Name=\(name)&Password=\(password)&Email=\(email)&Mobile=\(mobile)"
        request.httpBody = postString.data(using: .utf8)
        let urlconfig = URLSessionConfiguration.default
        urlconfig.timeoutIntervalForRequest = 60
        urlconfig.timeoutIntervalForResource = 60
        let task = URLSession(configuration: urlconfig).dataTask(with: request) { data, response, error in
            APIHelper.processDataResponseOnlyMessage(data: data, urlresponse: response as URLResponse?, error: error as NSError?,keyList:"", complete: { (json, error,arr) in
                completion(json, error)
            })
        }
        task.resume()
    }
    func APIActiveUser(userID: String,passcode: String, token: String, completion: @escaping ( _ data: NSDictionary?, _ error:APIError?) -> ()) {
        var request = URLRequest(url: URL(string: "\(baseUrl!)ActiveUser.php")!)
        request.httpMethod = "POST"
        let postString = "UserID=\(userID)&Passcode=\(passcode)&Token=\(token)"
        request.httpBody = postString.data(using: .utf8)
        let urlconfig = URLSessionConfiguration.default
        urlconfig.timeoutIntervalForRequest = 60
        urlconfig.timeoutIntervalForResource = 60
        let task = URLSession(configuration: urlconfig).dataTask(with: request) {data, response, error in
            APIHelper.processDataResponseOnlyMessage(data: data, urlresponse: response as URLResponse?, error: error as NSError?,keyList:"", complete: { (json,error,arr) in
                completion(json,error)
            })
        }
        task.resume()
    }
    func APIReadUser(userID: String,PageID:String,Number:String, completion: @escaping ( _ data: NSArray?, _ error:APIError?) -> ()) {
        var request = URLRequest(url: URL(string: "\(baseUrl!)ReadUser.php")!)
        request.httpMethod = "POST"
        let postString = "UserID=\(userID)&PageID=\(PageID)&Number=\(Number)"
        request.httpBody = postString.data(using: .utf8)
        let urlconfig = URLSessionConfiguration.default
        urlconfig.timeoutIntervalForRequest = 60
        urlconfig.timeoutIntervalForResource = 60
        let task = URLSession(configuration: urlconfig).dataTask(with: request) {data, response, error in
            APIHelper.processDataResponseOnlyMessage(data: data, urlresponse: response as URLResponse?, error: error as NSError?,keyList:key_status_list, complete: { (json:NSDictionary?,error:APIError?,arr) in
                completion(arr,error)
            })
        }
        task.resume()
    }
    func APIUpdateUser(userID:String,name: String,fullName: String, email: String, dob: String, address: String, gender: String, introduction: String, ImageAvatar: String, completion: @escaping ( _ data: NSDictionary?, _ error:APIError?) -> ()) {
        var request = URLRequest(url: URL(string: "\(baseUrl!)UpdateUser.php")!)
        request.httpMethod = "POST"
        let postString = "UserID=\(userID)&Name=\(name)&FullName=\(fullName)&Email=\(email)&DOB=\(dob)&Address=\(address)&gender=\(gender)&Introduction=\(introduction)&ImageAvatar=\(ImageAvatar)"
        request.httpBody = postString.data(using: .utf8)
        let urlconfig = URLSessionConfiguration.default
        urlconfig.timeoutIntervalForRequest = 60
        urlconfig.timeoutIntervalForResource = 60
        let task = URLSession(configuration: urlconfig).dataTask(with: request) { data, response, error in
            APIHelper.processDataResponseOnlyMessage(data: data, urlresponse: response as URLResponse?, error: error as NSError?,keyList:"", complete: { (json, error,arr) in
                completion(json,error)
            })
        }
        task.resume()
    }
    func APIGetListQuestion(QuestionID:String,UserID:String,IDSpec:String,PageID:String,Number:String, completion: @escaping ( _ data: NSArray?, _ error:APIError?) -> ()) {
        var request = URLRequest(url: URL(string: "\(baseUrl!)GetListQuestion.php")!)
        request.httpMethod = "POST"
        let postString = "QuestionID=\(QuestionID)&UserID=\(UserID)&IDSpec=\(IDSpec)&PageID=\(PageID)&Number=\(Number)"
        request.httpBody = postString.data(using: .utf8)
        let urlconfig = URLSessionConfiguration.default
        urlconfig.timeoutIntervalForRequest = 60
        urlconfig.timeoutIntervalForResource = 60
        let task = URLSession(configuration: urlconfig).dataTask(with: request) {data, response, error in
            APIHelper.processDataResponseOnlyMessage(data: data, urlresponse: response as URLResponse?, error: error as NSError?,keyList:key_status_list, complete: { (json:NSDictionary?,error:APIError?,arr) in
                completion(arr,error)
            })
        }
        task.resume()
    }
    func APIReadSpec(IDSpec:String,PageID:String,Number:String,completion: @escaping ( _ data: NSArray?, _ error:APIError?) -> ()){
        var request = URLRequest(url: URL(string: "\(baseUrl!)ReadSpec.php")!)
        request.httpMethod = "POST"
        let postString = "IDSpec=\(IDSpec)&PageID=\(PageID)&Number=\(Number)"
        request.httpBody = postString.data(using: .utf8)
        let urlconfig = URLSessionConfiguration.default
        urlconfig.timeoutIntervalForRequest = 60
        urlconfig.timeoutIntervalForResource = 60
        let task = URLSession(configuration: urlconfig).dataTask(with: request) {data, response, error in
            APIHelper.processDataResponseOnlyMessage(data: data, urlresponse: response as URLResponse?, error: error as NSError?,keyList:key_status_list, complete: { (json:NSDictionary?,error:APIError?,arr) in
                completion(arr,error)
            })
        }
        task.resume()
    }
    func APIInsertQuestion(UserID:String,Title:String,Time:String,Content:String,Image1:String,Image2:String,Image3:String,completion: @escaping (_ data:NSDictionary?,_ error:APIError?) ->()){
        var request = URLRequest(url: URL(string: "\(baseUrl!)InsertQuestion.php")!)
        request.httpMethod = "POST"
        let postString = "UserID=\(UserID)&Title=\(Title)&Time=\(Time)&Content=\(Content)&Image1=\(Image1)&Image2=\(Image2)&Image3=\(Image3)"
        request.httpBody = postString.data(using: .utf8)
        let urlconfig = URLSessionConfiguration.default
        urlconfig.timeoutIntervalForRequest = 60
        urlconfig.timeoutIntervalForResource = 60
        let task = URLSession(configuration: urlconfig).dataTask(with: request) {data, response, error in
            APIHelper.processDataResponseOnlyMessage(data: data, urlresponse: response as URLResponse?, error: error as NSError?,keyList:"", complete: { (json:NSDictionary?,error:APIError?,arr) in
                completion(json,error)
            })
        }
        task.resume()
    }
    func APIReadDoctor(IDSpec:String,PageID:String,Number:String,IDDoctor:String,completion: @escaping (_ data: NSArray?, _ error:APIError?) ->()){
        var request = URLRequest(url: URL(string: "\(baseUrl!)ReadDoctor.php")!)
        request.httpMethod = "POST"
        let postString = "IDSpec=\(IDSpec)&PageID=\(PageID)&Number=\(Number)&IDDoctor=\(IDDoctor)"
        request.httpBody = postString.data(using: .utf8)
        let urlconfig = URLSessionConfiguration.default
        urlconfig.timeoutIntervalForRequest = 60
        urlconfig.timeoutIntervalForResource = 60
        let task = URLSession(configuration: urlconfig).dataTask(with: request) {data, response, error in
            APIHelper.processDataResponseOnlyMessage(data: data, urlresponse: response as URLResponse?, error: error as NSError?,keyList:key_status_list, complete: { (json:NSDictionary?,error:APIError?,arr) in
                completion(arr,error)
            })
        }
        task.resume()
    }
}

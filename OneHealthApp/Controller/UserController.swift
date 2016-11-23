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
    func APILoginUser(username: String,password:String, completion: @escaping ( data: NSDictionary?, error:APIError?) -> ()) {
        var request = URLRequest(url: URL(string: "\(baseUrl!)LoginUser.php")!)
        request.httpMethod = "POST"
        let postString = "Mobile=\(username)&Password=\(password)&Type=0&Email=0&HardwareID=0"
        request.httpBody = postString.data(using: .utf8)
        let urlconfig = URLSessionConfiguration.default
        urlconfig.timeoutIntervalForRequest = 12
        urlconfig.timeoutIntervalForResource = 12
        let task = URLSession(configuration: urlconfig).dataTask(with: request) { data, response, error in
            APIHelper.processDataResponseOnlyMessage(data: data, urlresponse: response as URLResponse?, error: error as NSError?,keyList:"", complete: { (json, error) in
                completion(json, error)
            })
        }
        task.resume()
    }
    func APIRegisterUser(name: String, password: String, email: String,  mobile: String, completion: @escaping ( data: NSDictionary?, error:APIError?) -> ()) {
        var request = URLRequest(url: URL(string: "\(baseUrl!)RegisterUser.php")!)
        request.httpMethod = "POST"
        let postString = "Name=\(name)&Password=\(password)&Email=\(email)&Mobile=\(mobile)"
        request.httpBody = postString.data(using: .utf8)
        let urlconfig = URLSessionConfiguration.default
        urlconfig.timeoutIntervalForRequest = 12
        urlconfig.timeoutIntervalForResource = 12
        let task = URLSession(configuration: urlconfig).dataTask(with: request) { data, response, error in
            APIHelper.processDataResponseOnlyMessage(data: data, urlresponse: response as URLResponse?, error: error as NSError?,keyList:"", complete: { (json, error) in
                completion(json, error)
            })
        }
        task.resume()
    }
    func APIActiveUser(userID: String,passcode: String, token: String, completion: @escaping ( data: NSDictionary?, error:APIError?) -> ()) {
        var request = URLRequest(url: URL(string: "\(baseUrl!)ActiveUser.php")!)
        request.httpMethod = "POST"
        let postString = "UserID=\(userID)&Passcode=\(passcode)&Token=\(token)"
        request.httpBody = postString.data(using: .utf8)
        let urlconfig = URLSessionConfiguration.default
        urlconfig.timeoutIntervalForRequest = 12
        urlconfig.timeoutIntervalForResource = 12
        let task = URLSession(configuration: urlconfig).dataTask(with: request) {data, response, error in
            APIHelper.processDataResponseOnlyMessage(data: data, urlresponse: response as URLResponse?, error: error as NSError?,keyList:"", complete: { (json, error) in
                completion(json, error)
            })
        }
        task.resume()
    }
    func APIReadUser(userID: String, completion: @escaping ( data: NSDictionary?, error:APIError?) -> ()) {
        var request = URLRequest(url: URL(string: "\(baseUrl!)ReadUser.php")!)
        request.httpMethod = "POST"
        let postString = "UserID=\(userID)"
        request.httpBody = postString.data(using: .utf8)
        let urlconfig = URLSessionConfiguration.default
        urlconfig.timeoutIntervalForRequest = 12
        urlconfig.timeoutIntervalForResource = 12
        let task = URLSession(configuration: urlconfig).dataTask(with: request) {data, response, error in
            APIHelper.processDataResponseOnlyMessage(data: data, urlresponse: response as URLResponse?, error: error as NSError?,keyList:key_status_list, complete: { (json, error) in
                
                completion(json, error)
            })
        }
        task.resume()
    }
    func APIUpdateUser(userID: String,name: String, fullName: String, mobile: String, email: String, dob: String, address: String, gender: String, introduction: String, location: String, completion: @escaping ( data: NSDictionary?, error:APIError?) -> ()) {
        var request = URLRequest(url: URL(string: "\(baseUrl!)isActive.php")!)
        request.httpMethod = "POST"
        let postString = "UserID=\(userID)&Name=\(name)&FullName=\(fullName)&Mobile=\(mobile)&Email=\(email)&DOB=\(dob)&Address=\(address)&Gender=\(gender)&Introduction=\(introduction)&Location=\(location)"
        request.httpBody = postString.data(using: .utf8)
        let urlconfig = URLSessionConfiguration.default
        urlconfig.timeoutIntervalForRequest = 12
        urlconfig.timeoutIntervalForResource = 12
        let task = URLSession(configuration: urlconfig).dataTask(with: request) { data, response, error in
            APIHelper.processDataResponseOnlyMessage(data: data, urlresponse: response as URLResponse?, error: error as NSError?,keyList:"", complete: { (json, error) in
                completion(json, error)
            })
        }
        task.resume()
    }
    
}

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
    func readUser(userID: String,PageID:String,Number:String, completion: @escaping (_ arr:NSMutableArray?,_ error:APIError?) -> ()){
        self.userBussiness().APIReadUser(userID: userID,PageID:PageID,Number:Number) { (data:NSArray?,error:APIError?) in
            DispatchQueue.main.async {
                if error == nil {
                    if (data?.count)! > 0{
                        let arr:NSMutableArray = NSMutableArray()
                        let name = (data?[0] as! NSDictionary)["Name"] as! String
                        arr.add(name)
                        let fullName = (data?[0] as! NSDictionary)["FullName"] as! String
                        arr.add(fullName)
                        let mobile = (data?[0] as! NSDictionary)["Mobile"] as! String
                        arr.add(mobile)
                        let email = (data?[0] as! NSDictionary)["Email"] as! String
                        arr.add(email)
                        let dob = (data?[0] as! NSDictionary)["DOB"] as! String
                        arr.add(dob)
                        let address = (data?[0] as! NSDictionary)["Address"] as! String
                        arr.add(address)
                        let gender = (data?[0] as! NSDictionary)["gender"] as! String
                        arr.add(gender)
                        let introduction = (data?[0] as! NSDictionary)["introduction"] as! String
                        arr.add(introduction)
                        let location = (data?[0] as! NSDictionary)["location"] as! String
                        arr.add(location)
                        completion(arr,nil)
                    }else{
                        let status = APIError.init(reason: "Không có dữ liệu", andCode: 0)
                        completion(nil,status)
                    }
                }else{
                    completion(nil,error)
                }
            }
        }
    }
    func updateUser(userID: String,name: String, fullName: String,email: String, dob: String, address: String, gender: String, introduction: String, ImageAvatar: String, completion: @escaping (_ status:Int,_ error:APIError?) -> ()){
        self.userBussiness().APIUpdateUser(userID: userID,name: name, fullName: fullName, email: email, dob: dob, address: address, gender: gender, introduction: introduction, ImageAvatar: ImageAvatar, completion:{ (data:NSDictionary?,error:APIError?) in
            DispatchQueue.main.async {
                if error == nil {
                    completion(data?[key_status_error] as! Int, error)
                }else{
                    completion(Int(status_code_failed), error)
                }
            }
        })
    }
    func GetListQuestion(QuestionID:String,UserID:String,IDSpec:String,PageID:String,Number:String , completion: @escaping (_ arr:NSMutableArray?,_ error:APIError?) ->()) {
        self.userBussiness().APIGetListQuestion(QuestionID: QuestionID, UserID: UserID, IDSpec: IDSpec,PageID:PageID,Number:Number ,completion:{(data:NSArray?,error:APIError?) in
            DispatchQueue.main.async {
                if error == nil {
                   completion(self.parseQuestion(data: data!),nil)
                }else{
                    completion(nil,error)
                }
            }
        })
    }
    func ReadSpec(IDSpec:String,PageID:String,Number:String ,completion: @escaping (_ arr:NSMutableArray?,_ error:APIError?) ->()) {
        self.userBussiness().APIReadSpec(IDSpec: IDSpec,PageID:PageID,Number:Number , completion:{(data:NSArray?,error:APIError?) in
            DispatchQueue.main.async {
                if error == nil {
                    completion(self.parseSpec(data: data!),nil)
                }else{
                    completion(nil,error)
                }
            }
        })
    }
    func InsertQuestion(UserID:String,Title:String,Time:String,Content:String,Image1:String,Image2:String,Image3:String,completion: @escaping (_ status:Int,_ error:APIError?) ->()){
        self.userBussiness().APIInsertQuestion(UserID: UserID, Title: Title, Time: Time, Content: Content, Image1: Image1, Image2: Image2, Image3: Image3, completion:{(data:NSDictionary?,error:APIError?) in
            DispatchQueue.main.async {
                if error == nil {
                    completion(data?[key_status_error] as! Int,nil)
                }else{
                    completion(Int(status_code_failed),error)
                }
            }
        })
    }
    func ReadDoctor(IDSpec:String,PageID:String,Number:String,IDDoctor:String,completion: @escaping (_ arr:NSMutableArray?,_ error:APIError?) ->()) {
        self.userBussiness().APIReadDoctor(IDSpec: IDSpec,PageID:PageID,Number:Number,IDDoctor:IDDoctor, completion:{(data:NSArray?,error:APIError?) in
            DispatchQueue.main.async {
                if error == nil {
                    completion(self.parseDoctor(data: data!),nil)
                }else{
                    completion(nil,error)
                }
            }
        })
    }
    //parse json
    func parseSpec(data:NSArray) -> NSMutableArray{
        let arr:NSMutableArray = NSMutableArray()
        for item in data {
            let spec:Spec = Spec()
            spec.SpecID = (item as? NSDictionary)?["SpecID"] as! String
            spec.Name = (item as? NSDictionary)?["Name"] as! String
            arr.add(spec)
        }
        return arr
    }
    func parseUser(data:NSDictionary)->User{
        let user:User = User()
        user.UserId = data["UserID"] as! String
        user.Token = data["Token"] as! String
        return user
    }
    func parseDoctor(data:NSArray)-> NSMutableArray{
        let arr:NSMutableArray = NSMutableArray()
        for item in data {
            let doctor:Doctor = Doctor()
            doctor.IDDoctor = (item as? NSDictionary)?["IDDoctor"] as! String
            doctor.IDSpec = (item as? NSDictionary)?["IDSpec"] as! String
            doctor.Name = (item as? NSDictionary)?["Name"] as! String
            doctor.FullName = (item as? NSDictionary)?["FullName"] as! String
            doctor.Email = (item as? NSDictionary)?["Email"] as! String
            doctor.Mobile = (item as? NSDictionary)?["Mobile"] as! String
            doctor.DOB = (item as? NSDictionary)?["DOB"] as! String
            doctor.Address = (item as? NSDictionary)?["Address"] as! String
            doctor.gender = (item as? NSDictionary)?["gender"] as! String
            doctor.introduction = (item as? NSDictionary)?["introduction"] as! String
            doctor.avatar = (item as? NSDictionary)?["avatar"] as! String
            doctor.location = (item as? NSDictionary)?["location"] as! String
            doctor.isActive = (item as? NSDictionary)?["isActive"] as! String
            doctor.PushToken = (item as? NSDictionary)?["PushToken"] as? String ?? ""
            arr.add(doctor)
        }
        return arr
    }
    func parseQuestion(data:NSArray) -> NSMutableArray{
        let arr:NSMutableArray = NSMutableArray()
        for item in data {
            let question:Question = Question()
            question.QuestionID = (item as? NSDictionary)?["QuestionID"] as! String
            question.UserId = (item as? NSDictionary)?["UserID"] as! String
            question.Title = (item as? NSDictionary)?["Title"] as! String
            question.times = (item as? NSDictionary)?["times"] as! String
            question.content = (item as? NSDictionary)?["content"] as! String
            question.IDSpec = (item as? NSDictionary)?["IDSpec"] as! String
            question.IsAnswer = (item as? NSDictionary)?["IsAnswer"] as! String
            question.ListImage = (item as? NSDictionary)?["ListImage"] as! NSArray
            arr.add(question)
        }
        return arr
    }
}

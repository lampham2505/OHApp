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
        instance.baseUrl = "abc"
        return instance
    }()
    func dosome(){
        print("ok single")
    }
}

//
//  User.swift
//  OneHealthApp
//
//  Created by Viet Anh on 11/4/16.
//  Copyright © 2016 OneHealth. All rights reserved.
//

import Foundation

class User: NSObject,NSCoding {
    var UserId:String = ""
    var Name :String = ""
    var FullName :String = ""
    var Mobile :String = ""
    var Email :String = ""
    var DOB :String = ""
    var Address :String = ""
    var Gender :String = ""
    var Introduction :String = ""
    var Location :String = ""
    var Token:String = ""
    var isActive :String = ""
    var Avatar :String = ""
    override init() {
    }
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.UserId, forKey: "UserId")
    }
    required init?(coder aDecoder: NSCoder) {
        self.UserId = aDecoder.decodeObject(forKey: "UserId") as! String
    }
}

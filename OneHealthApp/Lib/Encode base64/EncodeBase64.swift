//
//  EncodeBase64.swift
//  OneHealthApp
//
//  Created by Viet Anh on 11/24/16.
//  Copyright © 2016 OneHealth. All rights reserved.
//

import UIKit

class EncodeBase64: NSObject {
   static func imageToBase64(imageToDecode: UIImage!) -> String {
        let  imageData = UIImageJPEGRepresentation(imageToDecode, 0.8)
        var base64String = imageData?.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0))
        base64String = base64String?.replacingOccurrences(of: "+", with: "%2B", options: NSString.CompareOptions.literal, range: nil)
        base64String = base64String?.replacingOccurrences(of: "/", with: "%2F", options: NSString.CompareOptions.literal, range: nil)
        return base64String!
    }
}

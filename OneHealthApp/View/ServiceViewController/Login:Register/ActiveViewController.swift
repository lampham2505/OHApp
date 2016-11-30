//
//  ViewController.swift
//  OneHealthApp
//
//  Created by Lâm Phạm on 11/19/16.
//  Copyright © 2016 OneHealth. All rights reserved.
//

import UIKit

class ActiveViewController: UIViewController {

    @IBOutlet weak var txtfActiveCode: UITextField!
    var user:User!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func btnActiveAction(_ sender: AnyObject) {
        let passcode = txtfActiveCode.text!
        let passcodeStr = String(describing: passcode)
        APIManager.sharedInstance.activeUser(userID: user.UserId, passcode: passcodeStr, token: user.Token) { (_ status:Int,_ error:APIError?) in
            if error == nil {
                if (status == 0) {
                    let _statusError = APIError.init(reason: "Sai Passcode", andCode: 0)
                    Utils.show(_statusError)
                } else {
                    let _statusError = APIError.init(reason: "Kích hoạt thành cộng", andCode: 0)
                    Utils.show(_statusError, callback: {
                        
                    })
                }
            } else {
                Utils.show(error)
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

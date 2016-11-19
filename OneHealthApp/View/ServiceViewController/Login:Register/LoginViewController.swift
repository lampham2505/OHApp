//
//  LoginViewController.swift
//  OneHealthApp
//
//  Created by Lâm Phạm on 11/15/16.
//  Copyright © 2016 OneHealth. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    
    @IBOutlet weak var txtfUser: UITextField!
    @IBOutlet weak var txtfPassword: UITextField!
    
    //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: IBAction
    @IBAction func btnLoginTapped(_ sender: AnyObject) {
        let username = txtfUser.text
        let password = txtfPassword.text
        if ((username?.isEmpty)! && (password?.isEmpty)!) {
            let _statusError = APIError.init(reason: "Bạn phải nhập đầy đủ thông tin", andCode: 0)
            Utils.show(_statusError)
        } else {
            APIManager.sharedInstance.loginUser(username: username!, password: password!,   completion:{ (user: User?,error:APIError?) in
                if error == nil {
                    print(user?.UserId ?? "")
                }else{
                    print(error?.errorMessage ?? "")
                }
            })
        }
    }
    @IBAction func btnLoginDismissAction(_ sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: {})
    }
}

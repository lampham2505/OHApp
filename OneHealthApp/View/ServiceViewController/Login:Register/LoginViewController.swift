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
    
    //MARK: LoginButtonAction
    @IBAction func btnLoginTapped(_ sender: AnyObject) {
        let username = txtfUser.text
        let password = txtfPassword.text
        APIManager.sharedInstance.loginUser(username: username!, password: password!, completion:{ (user: User?,error:APIError?) in
            if error == nil {
                print(user?.UserId ?? "")
            }else{
                print(error?.errorMessage ?? "")
            }
        })
    }
    
    //MARK: Login API
    

}

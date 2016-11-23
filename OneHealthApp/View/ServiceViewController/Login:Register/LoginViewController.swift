//
//  LoginViewController.swift
//  OneHealthApp
//
//  Created by Lâm Phạm on 11/15/16.
//  Copyright © 2016 OneHealth. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    var bShowPassword:Bool = false
    
    @IBOutlet weak var txtfUser: UITextField!
    @IBOutlet weak var txtfPassword: UITextField!
    
    //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func login(username:String,password:String){
        MBProgressHUD.showAdded(to: self.view, animated: true)
        APIManager.sharedInstance.loginUser(username: username, password: password,   completion:{ (user: User?,error:APIError?) in
            MBProgressHUD.hide(for: self.view, animated: true)
            if error == nil {
                print(user?.UserId ?? "")
                let _statusError = APIError.init(reason: "Đăng nhập thành công", andCode: 1)
                Utils.show(_statusError, callback: {
                    self.dismiss(animated: true)
                })
            }else{
                print(error?.errorMessage ?? "")
            }
        })
        
    }

    //MARK: IBAction
    @IBAction func btnLoginTapped(_ sender: AnyObject) {
        let username = txtfUser.text
        let password = txtfPassword.text
        if ((username?.isEmpty)! && (password?.isEmpty)!) {
            let _statusError = APIError.init(reason: "Bạn phải nhập đầy đủ thông tin", andCode: 0)
            Utils.show(_statusError)
        } else {
            login(username: username!, password: password!)
        }
    }
    @IBAction func btnLoginDismissAction(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: {})
    }
    @IBAction func btnCheckBoxAction(_ sender: AnyObject) {
        bShowPassword = !bShowPassword
        txtfPassword.isSecureTextEntry = !bShowPassword
    }
//    // MARK: - Textfield Delegate
//    func hideKeyboard() {
//        //Causes the view (or one of its embedded text fields) to resign the first responder status.
//        view.endEditing(true)
//    }
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        //hide keyboard
//        //textField.resignFirstResponder()
//        let nextTag = textField.tag + 1
//        // Try to find next responder
//        let nextResponder = textField.superview?.viewWithTag(nextTag) as UIResponder!
//        
//        if (nextResponder != nil){
//            // Found next responder, so set it.
//            nextResponder?.becomeFirstResponder()
//            
//        }
//        else
//        {
//            // Not found, so remove keyboard
//            textField.resignFirstResponder()
//            hideKeyboard()
//        }
//        return true
//    }
}

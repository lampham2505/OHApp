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
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(LoginViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    func dismissKeyboard(){
        self.view.endEditing(true)
    }
    func login(username:String,password:String){
        MBProgressHUD.showAdded(to: self.view, animated: true)
        APIManager.sharedInstance.loginUser(username: username, password: password,   completion:{ (user: User?,error:APIError?) in
            MBProgressHUD.hide(for: self.view, animated: true)
            if error == nil {
                let object = user! as User
                let data:NSData = NSKeyedArchiver.archivedData(withRootObject: object) as NSData
                UserDefaults.standard.set(data, forKey: keyUser)
                UserDefaults.standard.synchronize()
                let _statusSuccess = APIError.init(reason: "Đăng nhập thành công", andCode: 1)
                Utils.showSucess(_statusSuccess, callback: {
                    self.dismiss(animated: true)
                })
            }else{
                Utils.show(error)
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

}

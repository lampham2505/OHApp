//
//  RegisterViewController.swift
//  OneHealthApp
//
//  Created by Viet Anh on 11/16/16.
//  Copyright © 2016 OneHealth. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    var bShowPassword:Bool = false

    @IBOutlet weak var txtfName: UITextField!
    @IBOutlet weak var txtfPassword: UITextField!
    @IBOutlet weak var txtfPasswordConfirm: UITextField!
    @IBOutlet weak var txtfEmail: UITextField!
    @IBOutlet weak var txtfMobile: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    //MARK: - IBAction
    @IBAction func btnRegisterAction(_ sender: AnyObject) {
        //check the value of text field
        if (((txtfName.text?.isEmpty)! || (txtfMobile.text?.isEmpty)! || (txtfEmail.text?.isEmpty)!) || (txtfEmail.text?.isEmpty)!){
            let _statusError = APIError.init(reason: "Bạn phải nhập đầy đủ thông tin", andCode: 0)
            Utils.show(_statusError)
        } else if (txtfPassword.text != txtfPasswordConfirm.text){
                    let _statusError = APIError.init(reason: "Mật khẩu nhập lại không đúng", andCode: 0)
                    Utils.show(_statusError)
            }else {
            self.register(name: txtfName.text!, password: txtfPassword.text!, email: txtfEmail.text!, mobile:(txtfMobile.text!))
        }
    }
    @IBAction func btnCheckBoxAction(_ sender: AnyObject) {
        bShowPassword = !bShowPassword
        txtfPassword.isSecureTextEntry = !bShowPassword
        txtfPasswordConfirm.isSecureTextEntry = !bShowPassword
    }
   
    //MARK: Call API
    func register(name: String, password: String, email: String, mobile: String) {
        MBProgressHUD.showAdded(to: self.view, animated: true)
        APIManager.sharedInstance.registerUser(name: name, password: password, email: email, mobile: mobile) { (_ status:Int,_ error:APIError?) in
            MBProgressHUD.hide(for: self.view, animated: true)
            if error == nil {
                self.login(username: self.txtfMobile.text!, password: self.txtfPassword.text!)
            } else {
                Utils.show(error)
            }
        }
    }
    func login(username: String, password: String) {
        MBProgressHUD.showAdded(to: self.view, animated: true)
        APIManager.sharedInstance.loginUser(username: self.txtfMobile.text!, password: self.txtfPassword.text!, completion: { (user, error) in
            MBProgressHUD.hide(for: self.view, animated: true)
            if error == nil {
                self.pushToActiveVC(user: user!)
            }else{
                Utils.show(error)
            }
        })
    }
    func pushToActiveVC(user:User) {
        let VC = self.storyboard!.instantiateViewController(withIdentifier: "ActiveViewController") as! ActiveViewController
        VC.user = user
        self.navigationController?.pushViewController(VC, animated: true)
    }
}

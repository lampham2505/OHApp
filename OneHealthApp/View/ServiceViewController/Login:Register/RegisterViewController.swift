//
//  RegisterViewController.swift
//  OneHealthApp
//
//  Created by Viet Anh on 11/16/16.
//  Copyright © 2016 OneHealth. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

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
        if (((txtfName.text?.isEmpty)! || (txtfMobile.text?.isEmpty)! || (txtfEmail.text?.isEmpty)!)){
            let _statusError = APIError.init(reason: "Bạn phải nhập đầy đủ thông tin", andCode: 0)
            Utils.show(_statusError)
        } else {
           self.register(name: txtfName.text!, password: txtfPassword.text!, email: txtfEmail.text!, mobile:(txtfMobile.text!))
        }
        
    }
    //MARK: Call API
    func register(name: String, password: String, email: String, mobile: String) {
        APIManager.sharedInstance.registerUser(name: name, password: password, email: email, mobile: mobile) { (_ status:Int,_ error:APIError?) in
            if error == nil {
                self.login(username: self.txtfMobile.text!, password: self.txtfPassword.text!)
                self.present((self.alertView()), animated: true)
            } else {
                Utils.show(error)
            }
        }
    }
    func login(username: String, password: String) {
        APIManager.sharedInstance.loginUser(username: self.txtfMobile.text!, password: self.txtfPassword.text!, completion: { (user, error) in
            if error == nil {
                
                self.present((self.alertView()), animated: true)
            } else {
                Utils.show(error)
            }
        })
    }
    func activeUserAlert(userID: String, passcode: String, token: String) {
        APIManager.sharedInstance.activeUser(userID: userID, passcode: passcode, token: token) { (_ status:Int,_ error:APIError?) in
            if error == nil {
                self.present((self.alertView()), animated: true)
            } else {
                Utils.show(error)
            }
        }
    }
    func alertView() -> UIAlertController{
        let registerCodeAlert = UIAlertController(title: "Nhập mã xác thực", message: "Một mã xác thực đã được gửi đến số điện thoại của bạn dưới dạng tin nhắn, hãy nhập nó vào ô bên dưới", preferredStyle: .alert)
            registerCodeAlert.addTextField { (textField : UITextField!) -> Void in
                let cancelAction = UIAlertAction(title: "Để sau", style: .cancel, handler: {(registerCodeAlert) -> Void in()
                })
            }
        let firstTextField = registerCodeAlert.textFields![0] as UITextField
        firstTextField.placeholder = "Mã xác thực"
        firstTextField.layer.cornerRadius = 20.0
        let registerAction = UIAlertAction(title: "Đăng ký", style: .default, handler: {(registerCodeAlert) -> Void in()
            if (firstTextField.text?.isEmpty)! {
                return
            }else {
                self.activeUserAlert(userID: "", passcode: "", token: "")
            }
        })
        registerCodeAlert.addAction(registerAction)
        return registerCodeAlert
    }
    
}

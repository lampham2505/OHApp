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
        loginAPI(username: username!, password: password!) {_ in 
            //
        }
    }
    
    //MARK: Login API
    func loginAPI(username: String, password: String, completion:(_ result: String) -> Void) {
        let data = "Email=\(username)&Password=\(password)".data(using: .utf8)
        let url:URL = URL(string: "http://localhost/webservice/LoginUser.php")!
        let request = NSMutableURLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        let session = URLSession.shared
        request.httpMethod = "POST"
        request.httpBody = data
        //        request.allHTTPHeaderFields = headers
        let dataTask = session.dataTask(with: request as URLRequest) { (data, res, error) in
            if data != nil {
                let json = try? JSONSerialization.jsonObject(with: data!, options: [])
                print(json)
                if let response = res as? HTTPURLResponse , 200...299 ~= response.statusCode {
                } else {
                }
            }
        }
        dataTask.resume()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

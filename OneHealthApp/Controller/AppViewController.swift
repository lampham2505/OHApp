//
//  AppViewController.swift
//  OneHealthApp
//
//  Created by Lâm Phạm on 11/21/16.
//  Copyright © 2016 OneHealth. All rights reserved.
//

import UIKit

class AppViewController: UIViewController {

    static var shareInstance = AppViewController()
    
    var user = User()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

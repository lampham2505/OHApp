//
//  SeclectDepartmentViewController.swift
//  OneHealthApp
//
//  Created by Viet Anh on 11/4/16.
//  Copyright © 2016 OneHealth. All rights reserved.
//

import UIKit
public protocol ChooseDepartment:class {
    func SelecTabbar(with: String)
}
class SeclectDepartmentViewController: UIViewController {
    internal var delegate:ChooseDepartment!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    //IBAction
    @IBAction func btnActionDone(_ sender: AnyObject) {
        if delegate != nil {
            delegate.SelecTabbar(with: "a")
        }
        self.dismiss(animated: true, completion: nil)
    }
}

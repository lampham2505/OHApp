//
//  InfoViewController.swift
//  OneHealthApp
//
//  Created by Viet Anh on 11/16/16.
//  Copyright © 2016 OneHealth. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var arrListInfo :[String] = ["Tên hiển thị", "Tên đầy đủ", "Số điện thoại", "Email", "Ngày sinh", "Địa chỉ", "Giới tính", "Giới thiệu", "Địa điểm"]

    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var viewHeader: UIView!
    @IBOutlet weak var imgAvatar: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblCredit: UILabel!
    @IBOutlet weak var tblInfo: UITableView!
    
    //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        tblInfo.dataSource = self
        tblInfo.delegate = self
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        settingNavBar()
        tblInfo.reloadData()
    }
    //MARK: - Button Action
    @IBAction func btnSaveAction(_ sender: AnyObject) {
//        APIManager.sharedInstance.updateUser(userID: user.UserID, name: user.Name, fullName: user.FullName, mobile: user.Mobile, email: user.Email, dob: user.DOB, address: user.Address, gender: user.gender, introduction: user.Introduciton, location: user.Locatio { (_ status:Int,_ error:APIError?) in
//            if error == nil {
//                print("Update Successfully")
//            } else {
//                Utils.show(error)
//            }
//        })
    }
    //MARK: Setting NavBar
    func settingNavBar() {
        let revealController:SWRevealViewController = self.revealViewController()
        revealController.panGestureRecognizer()
        revealController.tapGestureRecognizer()
        let img:UIImage = UIImage(named: "reveal-icon")!
        let revealButtonItem = UIBarButtonItem.init(image: img, style: .plain, target: revealController, action: #selector(revealController.revealToggle(_:)))
        self.navigationItem.leftBarButtonItem = revealButtonItem
    }
    //MARK: TableView
    //TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrListInfo.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InfoCell", for: indexPath) as? InfoTableViewCell
        cell?.lblHeader.text = arrListInfo[indexPath.row]
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.bounds.size.height/6
    }
    func callBackFrommCell(indexpth:Int) {
        if indexpth == 0 {
            performSegue(withIdentifier: "ServiceMedicalExamination", sender: nil)
        }else if indexpth == 1 {
            performSegue(withIdentifier: "ServiceOnline", sender: nil)
        }else{
            performSegue(withIdentifier: "SelectDepartment", sender: nil)
        }
    }

}

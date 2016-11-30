//
//  InfoViewController.swift
//  OneHealthApp
//
//  Created by Viet Anh on 11/16/16.
//  Copyright © 2016 OneHealth. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate,UITextFieldDelegate {
    
    var arrListHeader :[String] = ["Tên hiển thị", "Tên đầy đủ", "Số điện thoại", "Email", "Ngày sinh", "Địa chỉ", "Giới tính", "Giới thiệu", "Địa điểm"]
    var arrListInfo:NSMutableArray = NSMutableArray()
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
        tblInfo.rowHeight = UITableViewAutomaticDimension
        tblInfo.estimatedRowHeight = 70
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getInfoUser()
        settingNavBar()
    }
    //MARK: - Button Action
    @IBAction func btnSaveAction(_ sender: AnyObject) {
        //let image : UIImage = UIImage(named:"list_chat")!
        //imgAvatar.image = image
        //let a = EncodeBase64.imageToBase64(imageToDecode: image)
        MBProgressHUD.showAdded(to: self.view, animated: true)
        let data:Data? = UserDefaults.standard.object(forKey: keyUser) as? Data
        if data == nil {
            MBProgressHUD.hide(for: self.view, animated: true)
            let status = APIError.init(reason: "Bạn chưa đăng nhập", andCode: 0)
            Utils.show(status)
        }else{
            let user = NSKeyedUnarchiver.unarchiveObject(with: data!) as! User
            APIManager.sharedInstance.updateUser(userID: user.UserId, name: arrListInfo[0] as! String, fullName: arrListInfo[1] as! String, email: arrListInfo[3] as! String, dob: arrListInfo[4] as! String, address: arrListInfo[5] as! String, gender: arrListInfo[6] as! String, introduction: arrListInfo[7] as! String, ImageAvatar: ""){ (_ status:Int,_ error:APIError?) in
                MBProgressHUD.hide(for: self.view, animated: true)
                if error != nil{
                    Utils.show(error)
                }else{
                    switch status {
                    case 0:
                        let err = APIError.init(reason: "Update thất bại", andCode: 0)
                        Utils.show(err)
                    case 1:
                        let err = APIError.init(reason: "Update thành công", andCode: 1)
                        Utils.showSucess(err)
                        default:
                        break
                    }
                }
            }
        }
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
    func getInfoUser() {
        MBProgressHUD.showAdded(to: self.view, animated: true)
        let data:Data? = UserDefaults.standard.object(forKey: keyUser) as? Data
        if data == nil {
            MBProgressHUD.hide(for: self.view, animated: true)
            let status = APIError.init(reason: "Bạn chưa đăng nhập", andCode: 0)
            Utils.show(status)
        }else{
            let user = NSKeyedUnarchiver.unarchiveObject(with: data!) as! User
            APIManager.sharedInstance.readUser(userID: user.UserId,PageID:"1",Number:"1") { (arr, error) in
                MBProgressHUD.hide(for: self.view, animated: true)
                if error == nil {
                    self.arrListInfo = arr!
                }else{
                    Utils.show(error)
                }
                self.tblInfo.reloadData()
            }

        }
    }
    //TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrListInfo.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InfoCell", for: indexPath) as? InfoTableViewCell
        cell?.lblHeader.text = arrListHeader[indexPath.row]
        cell?.txtfInfo.text = self.arrListInfo[indexPath.row] as? String
        if indexPath.row == 2 || indexPath.row == 8 {
            cell?.txtfInfo.isUserInteractionEnabled = false
        }else{
            cell?.txtfInfo.tag = indexPath.row
            cell?.txtfInfo.delegate = self
        }
        return cell!
    }
    //textfied delegate
    func textFieldDidEndEditing(_ textField: UITextField) {
        arrListInfo.replaceObject(at: textField.tag, with: textField.text!)
    }
}

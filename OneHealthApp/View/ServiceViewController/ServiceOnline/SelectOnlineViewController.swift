//
//  SelectOnlineViewController.swift
//  OneHealthApp
//
//  Created by Viet Anh on 11/4/16.
//  Copyright © 2016 OneHealth. All rights reserved.
//

import UIKit

class SelectOnlineViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet var myTable: UITableView!
    var arrListSpec:NSMutableArray = NSMutableArray()
    override func viewDidLoad() {
        super.viewDidLoad()
        myTable.delegate = self
        myTable.dataSource = self
        myTable.rowHeight = UITableViewAutomaticDimension
        myTable.estimatedRowHeight = 105
        GetListSpec()
    }
    func GetListSpec(){
        MBProgressHUD.showAdded(to: self.view, animated: true)
        APIManager.sharedInstance.ReadSpec(IDSpec: "",PageID:"",Number:limitItem , completion:{ (arr,error) in
            MBProgressHUD.hide(for: self.view, animated: true)
            if error == nil {
                for item in arr!{
                    self.arrListSpec.add(item as! Spec)
                }
            }else{
                Utils.show(error)
            }
            self.myTable.reloadData()
        })
    }
    //tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrListSpec.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SelectOnlineViewControllerTableViewCell
        let spec = arrListSpec[indexPath.row] as! Spec
        cell.setSpec(spec: spec)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SelectDoctorViewController") as! SelectDoctorViewController
        let spec = arrListSpec[indexPath.row] as! Spec
        vc.spec = spec
        self.navigationController?.pushViewController(vc, animated: true)
    }
    //IBAction
    @IBAction func btnActionBack(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
}

//
//  SelectDoctorViewController.swift
//  OneHealthApp
//
//  Created by Viet Anh on 11/7/16.
//  Copyright © 2016 OneHealth. All rights reserved.
//

import UIKit

class SelectDoctorViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet var myTable: UITableView!
    var arrListDoctor:NSMutableArray = NSMutableArray()
    var spec:Spec = Spec()
    override func viewDidLoad() {
        super.viewDidLoad()
        myTable.delegate = self
        myTable.dataSource = self
        myTable.rowHeight = UITableViewAutomaticDimension
        myTable.estimatedRowHeight = 110
        getListDoctor()
    }
    func getListDoctor(){
        MBProgressHUD.showAdded(to: self.view, animated: true)
        APIManager.sharedInstance.ReadDoctor(IDSpec:spec.SpecID,PageID:"",Number:limitItem,IDDoctor:"", completion:{ (arr,error) in
            MBProgressHUD.hide(for: self.view, animated: true)
            if error == nil {
                for item in arr!{
                    self.arrListDoctor.add(item as! Doctor)
                }
            }else{
                Utils.show(error)
            }
            self.myTable.reloadData()
        })
    }
    //tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrListDoctor.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SelectDoctorTableViewCell
        let doctor:Doctor = arrListDoctor[indexPath.row] as! Doctor
        cell.setListDoctor(doctor: doctor,spec:spec)
        return cell
    }
}

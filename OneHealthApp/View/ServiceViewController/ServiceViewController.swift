//
//  ServiceViewController.swift
//  OneHealthApp
//
//  Created by Viet Anh on 11/4/16.
//  Copyright © 2016 OneHealth. All rights reserved.
//

import UIKit

class ServiceViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,ChooseDepartment {

    @IBOutlet var myTable: UITableView!
    var arrTitle:[String] = ["Dịch vụ đặt lịch khám bệnh tại nhà","Dịch vụ tư vấn online","tin tức đặt câu hỏi tư vấn"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTable.delegate = self
        myTable.dataSource = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        settingNavBar()
    }
    func settingNavBar() {
        let revealController:SWRevealViewController = self.revealViewController()
        revealController.panGestureRecognizer()
        revealController.tapGestureRecognizer()
        let img:UIImage = UIImage(named: "reveal-icon")!
        let revealButtonItem = UIBarButtonItem.init(image: img, style: .plain, target: revealController, action: #selector(revealController.revealToggle(_:)))
        self.navigationItem.leftBarButtonItem = revealButtonItem
    }
    //TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrTitle.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? ServiceTableViewCell
        cell?.lblTitle.text = arrTitle[indexPath.row]
        cell?.index = indexPath.row
        cell?.respondToButton = { (indexpth:Int) -> Void in
            self.callBackFrommCell(indexpth: indexpth)
        }
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.bounds.size.height/CGFloat(arrTitle.count)
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
    //protocol
    func SelecTabbar(with: String) {
         self.tabBarController?.selectedIndex = 0
    }
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "SelectDepartment" {
            let vc:SeclectDepartmentViewController = segue.destination.childViewControllers[0] as! SeclectDepartmentViewController
            vc.delegate = self
        }
    }


}

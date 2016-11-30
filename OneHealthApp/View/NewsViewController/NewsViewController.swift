//
//  NewsViewController.swift
//  OneHealthApp
//
//  Created by Viet Anh on 11/5/16.
//  Copyright © 2016 OneHealth. All rights reserved.
//

import UIKit



class NewsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    

    @IBOutlet weak var sgmChangeTab: UISegmentedControl!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var btnOutletQuestion: UIButton!
    var cellType:String = "N"
    var arrListQuestion:NSMutableArray = NSMutableArray()
    var arrListNews:NSMutableArray = NSMutableArray()
    //MARK: ViewDidLoad
    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 140
        settingNavBar()
        btnOutletQuestion.isHidden = true
    }
    //TabbleView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if cellType == "N" {
            return 10
        }else{
            return arrListQuestion.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsTableViewCell
        if cellType == "N"{
            cell.lblHeader.text = "tieu de"
            return cell
        }else{
            let question:Question = arrListQuestion[indexPath.row] as! Question
            cell.QuestionList(question: question)
            return cell
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
    //Get List Question
    func GetListQuestion(){
        MBProgressHUD.showAdded(to: self.view, animated: true)
        APIManager.sharedInstance.GetListQuestion(QuestionID: "", UserID: "", IDSpec: "",PageID:"",Number:limitItem , completion:{ (arr,error) in
            MBProgressHUD.hide(for: self.view, animated: true)
            if error == nil {
                self.arrListQuestion.removeAllObjects()
                self.arrListQuestion = arr!
            }else{
                Utils.show(error)
            }
            self.tableView.reloadData()
        })
    }
    func changeSGM(key:Int){
        switch key {
        case 0:
            cellType = "N"
            btnOutletQuestion.isHidden = true
            tableView.reloadData()
        case 1:
            cellType = "Q"
            btnOutletQuestion.isHidden = false
            GetListQuestion()
        default:
            break
        }
    }
    //IBAction
    @IBAction func sgmChangeTabAction(_ sender: UISegmentedControl) {
        changeSGM(key: sgmChangeTab.selectedSegmentIndex)
    }
}

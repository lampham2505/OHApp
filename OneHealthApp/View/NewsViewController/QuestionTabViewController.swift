//
//  QuestionTabViewController.swift
//  OneHealthApp
//
//  Created by Lâm Phạm on 11/21/16.
//  Copyright © 2016 OneHealth. All rights reserved.
//

import UIKit

// MARK: QuestionTabViewControllerDelegate
//protocol QuestionTabViewControllerDelegate :NSObjectProtocol{
//    func AddQuestion()
//}


class QuestionTabViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var arrList:[String] = ["tieu de","cau hoi","tra loi"]
    
    //var delegate :QuestionTabViewControllerDelegate?
    
    @IBOutlet weak var btnAddQuestion: UIButton!
    @IBOutlet weak var tblQuestion: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblQuestion.delegate = self
        tblQuestion.dataSource = self
        tblQuestion.rowHeight = UITableViewAutomaticDimension
        tblQuestion.estimatedRowHeight = 140
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func btnAddQuesitonAction(_ sender: AnyObject) {
        //delegate?.AddQuestion()
        NotificationCenter.default.post(name: Notification.Name(rawValue: "pushToAddQuestionVC"), object: nil)
    }
    
    //tableView
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell", for: indexPath) as! QuestionTabTableViewCell
        cell.lblHeader.text = arrList[0]
        cell.lblQuestion.text = arrList[1]
        cell.lblAnswer.text = arrList[2]
        return cell
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

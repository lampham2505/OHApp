//
//  NewsTabViewController.swift
//  OneHealthApp
//
//  Created by Lâm Phạm on 11/21/16.
//  Copyright © 2016 OneHealth. All rights reserved.
//

import UIKit

class NewsTabViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var arrList:[String] = ["tieu de","cau hoi","tra loi"]
    @IBOutlet weak var tblNews: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblNews.delegate = self
        tblNews.dataSource = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    //tableView
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsTableViewCell
        cell.lblHeader.text = arrList[0]
        //cell.lblQuestion.text = arrList[1]
        //cell.lblAnswer.text = arrList[2]
        return cell
    }

}

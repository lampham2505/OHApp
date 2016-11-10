//
//  InfoViewController.swift
//  OneHealthApp
//
//  Created by Viet Anh on 11/8/16.
//  Copyright © 2016 OneHealth. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet var myTable: UITableView!
    @IBOutlet var btnOutletAvatar: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTable.delegate = self
        myTable.dataSource = self
        myTable.estimatedRowHeight = 10
        myTable.rowHeight = UITableViewAutomaticDimension
//        btnOutletAvatar.layer.cornerRadius  = btnOutletAvatar.bounds.size.width/2
        btnOutletAvatar.layer.cornerRadius = 20
        btnOutletAvatar.layer.masksToBounds = true
        btnOutletAvatar.layer.borderColor = UIColor.white.cgColor
        btnOutletAvatar.layer.borderWidth = 1
    }
    //tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
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

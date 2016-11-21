//
//  NewsViewController.swift
//  OneHealthApp
//
//  Created by Viet Anh on 11/5/16.
//  Copyright © 2016 OneHealth. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {
    
    @IBOutlet weak var lblWelcome: UILabel!
    @IBOutlet weak var sgmChangeTab: UISegmentedControl!
    @IBOutlet weak var vNews: UIView!
    @IBOutlet weak var vQuestion: UIView!
    
    //MARK: ViewDidLoad
    override func viewDidLoad() {
        vNews.isHidden = false
        vQuestion.isHidden = true
        settingNavBar()
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
    @IBAction func sgmChangeTabAction(_ sender: UISegmentedControl) {
        switch sgmChangeTab.selectedSegmentIndex {
        case 0:
            vNews.isHidden = false
            vQuestion.isHidden = true
        case 1:
            vNews.isHidden = true
            vQuestion.isHidden = false
        default:
            break
        }
    }
}

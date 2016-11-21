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
        //performSegue(withIdentifier: "QuestionTabViewController", sender: nil)
        settingNavBar()
        NotificationCenter.default.addObserver(self, selector: #selector(self.AddQuestion), name:NSNotification.Name(rawValue: "pushToAddQuestionVC"), object: nil)
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
    
    //MARK: Child Delegate
    
    func AddQuestion() {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "AddQuestionViewController") as! UIViewController
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    //MARK: Set delegate for Question ContainerView
//    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if(segue.identifier == "QuestionTabViewController"){
//            let embedVC = segue.destination as! QuestionTabViewController
//            embedVC.delegate = self
//        }
//    }
}

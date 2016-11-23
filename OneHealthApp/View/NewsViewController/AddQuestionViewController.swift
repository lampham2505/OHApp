//
//  AddQuestionViewController.swift
//  OneHealthApp
//
//  Created by Lâm Phạm on 11/22/16.
//  Copyright © 2016 OneHealth. All rights reserved.
//

import UIKit

class AddQuestionViewController: UIViewController, UIGestureRecognizerDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    //Warning
    @IBOutlet weak var textHeader: UILabel!
    //View Header
    @IBOutlet weak var viewHeader: UIView!
    @IBOutlet weak var lblHeader: UILabel!
    @IBOutlet weak var txtfHeader: UITextField!
    @IBOutlet weak var txtvContent: UITextView!
    //View Content
    @IBOutlet weak var viewImage: UIView!
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img3: UIImageView!
    
    var imagePicker = UIImagePickerController()
    var imageList = [UIImage]()
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.pickImage(_:)))
        tap.delegate = self
        img1.addGestureRecognizer(tap)
        img2.addGestureRecognizer(tap)
        img3.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK: - Button Action
    //Btn Send
    @IBAction func btnSendQuestionAction(_ sender: AnyObject) {
        
    }
    //Btn Dismiss
    @IBAction func btnDismissAction(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: {})
    }
    //MARK: - Tap Gesture
    func pickImage(_ sender: UITapGestureRecognizer) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.savedPhotosAlbum){
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.savedPhotosAlbum
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!){
        imageList.append(image)
        img1.image = imageList[0]
        img2.image = imageList[1]
        img3.image = imageList[2]
        self.dismiss(animated: true, completion: { () -> Void in
        })
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

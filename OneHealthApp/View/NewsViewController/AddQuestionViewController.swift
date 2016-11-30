//
//  AddQuestionViewController.swift
//  OneHealthApp
//
//  Created by Lâm Phạm on 11/22/16.
//  Copyright © 2016 OneHealth. All rights reserved.
//

import UIKit

class AddQuestionViewController: UIViewController,  UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    //View Header
    @IBOutlet weak var txtfHeader: UITextField!
    @IBOutlet weak var txtvContent: UITextView!
    //View img
    @IBOutlet weak var imgbtn1: UIButton!
    @IBOutlet weak var imgbtn2: UIButton!
    @IBOutlet weak var imgbtn3: UIButton!
    
    var imagePicker:UIImagePickerController = UIImagePickerController()
    var baseString1 = ""
    var baseString2 = ""
    var baseString3 = ""
    var key:Int = 1
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
    }
    func SendQuestion(){
        let data:Data? = UserDefaults.standard.object(forKey: keyUser) as? Data
        MBProgressHUD.showAdded(to: self.view, animated: true)
        if data == nil {
            MBProgressHUD.hide(for: self.view, animated: true)
            let status = APIError.init(reason: "Bạn chưa đăng nhập", andCode: 0)
            Utils.show(status)
        }else{
            let user = NSKeyedUnarchiver.unarchiveObject(with: data!) as! User
            APIManager.sharedInstance.InsertQuestion(UserID: user.UserId, Title: txtfHeader.text!, Time: "", Content: txtvContent.text, Image1: baseString1, Image2: baseString2, Image3: baseString3,completion:{ (status,error) in
                MBProgressHUD.hide(for: self.view, animated: true)
                if error == nil {
                    switch status {
                    case 0:
                        let err = APIError.init(reason: "Gửi câu hỏi thất bại", andCode: 0)
                        Utils.show(err)
                    case 1:
                        let err = APIError.init(reason: "Gửi câu hỏi thành công", andCode: 1)
                        Utils.showSucess(err, callback: {
                            self.dismiss(animated: true, completion: nil)
                        })
                    default:
                        break
                    }
                    
                }else{
                    Utils.show(error)
                }
                
            })
        }
    }
    //picker image
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let img:UIImage = info[UIImagePickerControllerEditedImage] as!  UIImage
        MBProgressHUD.hide(for: self.view, animated: true)
//        imageData = UIImageJPEGRepresentation(img,0.2);
        switch key {
        case 1:
            imgbtn1.setImage(img, for: UIControlState.normal)
            baseString1 = EncodeBase64.imageToBase64(imageToDecode: img)
        case 2:
            imgbtn2.setImage(img, for: UIControlState.normal)
            baseString2 = EncodeBase64.imageToBase64(imageToDecode: img)
        case 3:
            imgbtn3.setImage(img, for: UIControlState.normal)
            baseString3 = EncodeBase64.imageToBase64(imageToDecode: img)
        default:
            break
        }
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        MBProgressHUD.hide(for: self.view, animated: true)
        picker.dismiss(animated: true, completion: nil)
    }
    func pickImageQuestion(){
        let popAvatarView:PopUpImageView = PopUpImageView(nibName: "PopUpImageView")
        popAvatarView.showWitAnimation(true)
        popAvatarView.btnOkCallBack =  { option in
            MBProgressHUD.showAdded(to: self.view, animated: true)
            if option == 0 {
                Camera.PresentPhotoLibrary(target: self, canEdit: true ,imagePicker: self.imagePicker)
            }else{
                Camera.PresentPhotoCamera(target: self, canEdit: true ,imagePicker: self.imagePicker)
            }
        }
    }
    //IBAction
    @IBAction func btnSendQuestionAction(_ sender: AnyObject) {
        SendQuestion()
    }
    @IBAction func btnSelectImg1(_ sender: Any) {
        key = 1
        pickImageQuestion()
    }
    @IBAction func btnSelectImg2(_ sender: Any) {
        key = 2
        pickImageQuestion()
    }
    @IBAction func btnSelectImg3(_ sender: Any) {
        key = 3
        pickImageQuestion()
    }
    @IBAction func btnDismissAction(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: {})
    }
    
}

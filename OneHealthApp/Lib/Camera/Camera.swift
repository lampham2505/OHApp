//
//  File.swift
//  ICU
//
//  Created by Viet Anh on 10/4/16.
//  Copyright © 2016 Vu Mai Hoang Hai Hung. All rights reserved.
//

import Foundation
import MobileCoreServices

class Camera{
    
    class func PresentPhotoLibrary(target: UIViewController, canEdit: Bool ,imagePicker:UIImagePickerController) {
        
        if !UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) && !UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            return
        }
        
        let type = kUTTypeImage as String
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            
            imagePicker.sourceType = .photoLibrary
            
            if let availableTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary) {
                
                if (availableTypes as NSArray).contains(type) {
                    
                    imagePicker.mediaTypes = [type]
                    imagePicker.allowsEditing = canEdit 
                }
            }
        } else if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum) {
            
            imagePicker.sourceType = .savedPhotosAlbum
            
            if let availableTypes = UIImagePickerController.availableMediaTypes(for: .savedPhotosAlbum) {
                
                if (availableTypes as NSArray).contains(type) {
                    
                    imagePicker.mediaTypes = [type]
                }
            }
        } else {
            return
        }
        
        imagePicker.allowsEditing = canEdit
        target.present(imagePicker, animated: true, completion: nil)
    }
    
    class func PresentPhotoCamera(target: UIViewController, canEdit: Bool ,imagePicker:UIImagePickerController) {
        
        if !UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            return
        }
        
        let type1 = kUTTypeImage as String
        
//        let imagePicker = UIImagePickerController()
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            
            if let availableTypes = UIImagePickerController.availableMediaTypes(for: .camera) {
                
                if (availableTypes as NSArray).contains(type1) {
                    
                    imagePicker.mediaTypes = [type1]
                    imagePicker.sourceType = UIImagePickerControllerSourceType.camera
                }
            }
            
            if UIImagePickerController.isCameraDeviceAvailable(.rear) {
                
                imagePicker.cameraDevice = UIImagePickerControllerCameraDevice.rear
            } else if UIImagePickerController.isCameraDeviceAvailable(.front) {
                imagePicker.cameraDevice = UIImagePickerControllerCameraDevice.front
            } else {
                //show alert no camera
                return
            }
            
            imagePicker.allowsEditing = canEdit
            imagePicker.showsCameraControls = true
            target.present(imagePicker, animated: true, completion: nil)
        }
    }
}

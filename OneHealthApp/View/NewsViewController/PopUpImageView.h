//
//  PopUpImageView.h
//  OneHealthApp
//
//  Created by Viet Anh on 11/25/16.
//  Copyright © 2016 OneHealth. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BasePopupView.h"
@interface PopUpImageView : BasePopupView
@property (nonatomic,copy)void(^btnOkCallBack) (int option);
- (IBAction)btnActionLibrary:(id)sender;
- (IBAction)btnActionCamera:(id)sender;
- (IBAction)btnCancel:(id)sender;
@end

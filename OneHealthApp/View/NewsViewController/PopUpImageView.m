//
//  PopUpImageView.m
//  OneHealthApp
//
//  Created by Viet Anh on 11/25/16.
//  Copyright © 2016 OneHealth. All rights reserved.
//

#import "PopUpImageView.h"

@implementation PopUpImageView
- (id)initWithNibName:(NSString *)nibName{
    self = [super initWithNibName:nibName];
    return self;
}

- (void)dealloc
{
    NSLog(@"");
}
- (IBAction)btnActionLibrary:(id)sender {
    [self dissmissWithAnimation:YES];
    if(self.btnOkCallBack != nil){
        self.btnOkCallBack(0);
    }
}

- (IBAction)btnActionCamera:(id)sender {
    [self dissmissWithAnimation:YES];
    if(self.btnOkCallBack != nil){
        self.btnOkCallBack(1);
    }
}

- (IBAction)btnCancel:(id)sender {
    [self dissmissWithAnimation:YES];
}
@end

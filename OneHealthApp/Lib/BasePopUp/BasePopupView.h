//
//  BasePopupView.h
//  ICU
//
//  Created by Vu Mai Hoang Hai Hung on 9/16/16.
//  Copyright © 2016 Vu Mai Hoang Hai Hung. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BasePopupView : UIView
@property (nonatomic,retain) UIWindow *window;
- (id)initWithNibName:(NSString*)nibName;
- (void)showWitAnimation:(BOOL)animation;
- (void)dissmissWithAnimation:(BOOL)animation;
@end

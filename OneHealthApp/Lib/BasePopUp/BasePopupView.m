//
//  BasePopupView.m
//  ICU
//
//  Created by Vu Mai Hoang Hai Hung on 9/16/16.
//  Copyright © 2016 Vu Mai Hoang Hai Hung. All rights reserved.
//

#import "BasePopupView.h"

@implementation BasePopupView

- (void)dealloc
{
    NSLog(@"");
}
- (id)init
{
    self = [super init];
    return self;
    
}

- (id)initWithNibName:(NSString*)nibName{
    if (self = [super init]){
     
        self = [[[NSBundle mainBundle] loadNibNamed:nibName owner:self options:nil] lastObject];
        return self;
    }
    return nil;
    
}

- (void)showWitAnimation:(BOOL)animation{
    
    __weak BasePopupView *owner = self;
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.windowLevel = UIWindowLevelAlert;
    self.window.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
    self.center = self.window.center;
    [self.window addSubview:self];
    [self.window makeKeyAndVisible];
    self.transform = CGAffineTransformMakeScale(.3, .3);
    self.alpha = 0;
    if (animation) {
        [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            owner.alpha = 1.0;
            owner.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished){
        }];
    }else{
        self.alpha = 1.0;
        self.transform = CGAffineTransformIdentity;
        
    }
    
}

- (void)dissmissWithAnimation:(BOOL)animation{
    
    if(animation)
    {
        [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            self.alpha = 0;
            self.transform = CGAffineTransformMakeScale(.3, .3);
        } completion:^(BOOL finished){
            [self removeFromSuperview];
            [self.window setHidden:YES];
            [[[[UIApplication sharedApplication] delegate] window] makeKeyAndVisible];
        }];

    }else{
        self.alpha = 0;
        self.transform = CGAffineTransformMakeScale(.3, .3);
        [self removeFromSuperview];
        [self.window setHidden:YES];
        [[[[UIApplication sharedApplication] delegate] window] makeKeyAndVisible];

    }
}

@end

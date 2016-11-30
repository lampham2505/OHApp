//
//  Utils.m
//  Cinema
//
//  Created by Vu Mai Hoang Hai Hung on 9/4/16.
//  Copyright © 2016 Vu Mai Hoang Hai Hung. All rights reserved.
//

#import "Utils.h"
#import "APIError.h"

@implementation Utils


+ (UIFont*)fontOpenSansBold:(CGFloat)size{
    return [UIFont fontWithName:@"OpenSans-Bold" size:size];
}

+ (UIFont*)fontOpenSansItalic:(CGFloat)size{
    return [UIFont fontWithName:@"OpenSans-Italic" size:size];
}

+ (UIFont*)fontOpenSansRegular:(CGFloat)size{
    return [UIFont fontWithName:@"OpenSans" size:size];
}
+ (UIView*)bottomLine:(UITextField*)textfield{
    UIView * bottomLine = [[UIView alloc]initWithFrame:CGRectMake(0, textfield.bounds.size.height-1, textfield.bounds.size.width, 1)];
    bottomLine.backgroundColor = [UIColor lightGrayColor];
    return bottomLine;
}

+ (void)showAPIError:(APIError*)error  {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error" message:error.errorMessage preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *actionOK = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alert addAction:actionOK];
    UIViewController *topview = [self topViewController:nil];
    [topview presentViewController:alert animated:YES completion:nil];
                                
}
+ (void)showSucess:(APIError*)error  {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Success" message:error.errorMessage preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *actionOK = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alert addAction:actionOK];
    UIViewController *topview = [self topViewController:nil];
    [topview presentViewController:alert animated:YES completion:nil];
    
}
+ (void)showSucess:(APIError*)error callback:(void(^)(void))callback {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Success" message:error.errorMessage preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *actionOK = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        callback();
    }];
    [alert addAction:actionOK];
    
    UIViewController *topview = [self topViewController:nil];
    [topview presentViewController:alert animated:YES completion:nil];
    
    
}
+ (void)showAPIError:(APIError*)error callback:(void(^)(void))callback {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error" message:error.errorMessage preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *actionOK = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        callback();
    }];
    [alert addAction:actionOK];
    
    UIViewController *topview = [self topViewController:nil];
    [topview presentViewController:alert animated:YES completion:nil];
    
    
}

+ (UIViewController*)topViewController: (UIViewController*)topView{
    UIViewController *viewController =  (topView != nil? topView:[UIApplication sharedApplication].keyWindow.rootViewController);
    
    if([viewController isKindOfClass:[UINavigationController class]]){
       return [self topViewController: [[(UINavigationController*)viewController viewControllers] lastObject]];
    }else if ([viewController isKindOfClass:[UITabBarController class]]){
        return  [self topViewController:[(UITabBarController*)viewController selectedViewController]];
    }else if (viewController.presentedViewController != nil){
        return [self topViewController:viewController.presentedViewController];
    }
    return viewController;
}

+ (void)initBorderforView:(UIView*)view cornerRadius:(CGFloat)radius borderColorHex:(UIColor*)borderColor borderWidth:(CGFloat)borderWidth masksToBound:(BOOL)maskToBound{
    view.layer.cornerRadius = radius;
  //  view.layer.borderColor = CGColor.colorWithHex(borderColorHex)
    view.layer.borderColor = borderColor.CGColor;
    view.layer.borderWidth = borderWidth;
    view.layer.masksToBounds = maskToBound;
}

@end

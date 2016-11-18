//
//  Utils.h
//  Cinema
//
//  Created by Vu Mai Hoang Hai Hung on 9/4/16.
//  Copyright © 2016 Vu Mai Hoang Hai Hung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "APIError.h"
@interface Utils : NSObject

//+ (UIFont*)fontOpenSansBold:(CGFloat)size;
//+ (UIFont*)fontOpenSansItalic:(CGFloat)size;
//+ (UIFont*)fontOpenSansRegular:(CGFloat)size;
//+ (UIView*)bottomLine:(UITextField*)textfield;
+ (void)showAPIError:(APIError*)error ;
+ (void)showAPIError:(APIError*)error callback:(void(^)(void))callback;
+ (void)initBorderforView:(UIView*)view cornerRadius:(CGFloat)radius borderColorHex:(UIColor*)borderColor borderWidth:(CGFloat)borderWidth masksToBound:(BOOL)maskToBound;
@end

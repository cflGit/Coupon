//
//  UIColor+Additions.h
//  UCityFramework
//
//  Created by admin on 15/11/26.
//  Copyright © 2015年 XunHuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface UIColor (Additions)
//通过16进制获取颜色
+ (UIColor *)colorFromHex:(NSUInteger)rgb alpha:(CGFloat)alpha;
//通过hex获取颜色
+ (UIColor *)colorWithHexString:(NSString *)hexString;
//生成随机颜色
+ (UIColor *)colorFromRadom;
//渐变颜色
+ (UIColor *)colorFromColor:(UIColor *)fromColor toColor:(UIColor *)toColor percent:(float)percent;

@end

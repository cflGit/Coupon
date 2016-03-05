//
//  PlaceholderTextView.h
//  SaleHelper
//
//  Created by gitBurning on 14/12/8.
//  Copyright (c) 2014年 Burning_git. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  要是用非 arc。。。。。。／／     -fno-objc-arc
 */
@interface PlaceholderTextView : UITextView
/**
 *  占位描述字符串
 */
@property(copy,nonatomic) NSString *placeholder;
/**
 *  占位字体颜色
 */
@property(strong,nonatomic) UIColor *placeholderColor;
/**
 *  占位字体大小
 */
@property(strong,nonatomic) UIFont * placeholderFont;

@end


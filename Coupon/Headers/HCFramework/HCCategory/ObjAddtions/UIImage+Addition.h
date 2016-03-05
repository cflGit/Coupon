//
//  UIImage+Addition.h
//  UCityFramework
//
//  Created by admin on 15/11/26.
//  Copyright © 2015年 XunHuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface UIImage (Addition)

//通过颜色生成相应的图片
+ (UIImage *)createImageWithColor:(UIColor *)color;
/**
 *  修改图片size
 *
 *  @param image      原图片
 *  @param targetSize 要修改的size
 *
 *  @return 修改后的图片
 */
+ (UIImage *)image:(UIImage*)image byScalingToSize:(CGSize)targetSize;

@end

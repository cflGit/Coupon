//
//  CustomNavigationController.h
//  CustomNavigationBarDemo
//
//  Created by jimple on 14-1-6.
//  Copyright (c) 2014年 Jimple Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomNavigationController : UINavigationController

/**
 *  // 是否可右滑返回
 *
 *  @param bCanDragBack 是否滑动条件
 */
- (void)navigationCanDragBack:(BOOL)bCanDragBack;

@end

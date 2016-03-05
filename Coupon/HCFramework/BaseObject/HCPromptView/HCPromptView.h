//
//  HCPromptView.h
//  framework_ios
//
//  Created by admin on 15/12/1.
//  Copyright © 2015年 XunHuan. All rights reserved.
//

#import "PoppingBaseView.h"

@interface HCPromptView : PoppingBaseView
/**
 *  提示框
 *
 *  @param message 提示信息
 *
 *  @return 提示框类
 */
+ (HCPromptView *)showMessage:(NSString *)message;

@end

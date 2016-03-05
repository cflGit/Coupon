//
//  HCPromptView.m
//  framework_ios
//
//  Created by admin on 15/12/1.
//  Copyright © 2015年 XunHuan. All rights reserved.
//

#import "HCPromptView.h"

@implementation HCPromptView

/**
 *  提示框
 *
 *  @param message 提示信息
 *
 *  @return 提示框类
 */
+ (HCPromptView *)showMessage:(NSString *)message {
    HCPromptView *view = [[HCPromptView alloc]initWithFrame:CGRectMake(0, 0, 200, 50)];
    UILabel *messageLabel = [[UILabel alloc]initWithFrame:view.bounds];
    messageLabel.font = [UIFont systemFontOfSize:14];
    messageLabel.textAlignment = NSTextAlignmentCenter;
    messageLabel.textColor = [UIColor whiteColor];
    messageLabel.backgroundColor = [UIColor darkGrayColor];
    messageLabel.text = message;
    [view addSubview:messageLabel];
    [view show];
    view.frametop -= 50;
    return view;
}

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self makeCornerRadius:5.0f];
        [self performSelector:@selector(cancel) withObject:nil afterDelay:1];
    }
    return self;
}
@end

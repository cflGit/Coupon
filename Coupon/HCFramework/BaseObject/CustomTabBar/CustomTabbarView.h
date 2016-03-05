//
//  tabbarView.h
//  tabbarTest
//
//  Created by Kevin Lee on 13-5-6.
//  Copyright (c) 2013年 Kevin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomTabbarViewController.h"

@interface CustomTabbarView : UIView

@property(nonatomic,strong) UIButton *button1;
@property(nonatomic,strong) UIButton *button2;
@property(nonatomic,strong) UIButton *button3;

@property(nonatomic,weak) id<tabbarDelegate> delegate;

@end

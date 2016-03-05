//
//  tabbarViewController.h
//  tabbarTest
//
//  Created by Kevin Lee on 13-5-6.
//  Copyright (c) 2013年 Kevin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol tabbarDelegate <NSObject>

-(void)touchBtnAtIndex:(NSInteger)index;

@end

@class CustomTabbarView;

@interface CustomTabbarViewController : UIViewController<tabbarDelegate>

@property(nonatomic,strong) CustomTabbarView *tabbar;

@property(nonatomic,strong) NSArray *arrayViewcontrollers;

- (void)hideTabbar:(BOOL)hide;

@end




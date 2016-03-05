//
//  AppDelegate.h
//  UCityFramework
//
//  Created by admin on 15/11/27.
//  Copyright © 2015年 XunHuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomTabbarViewController.h"
#import "AppMangerDelegate.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

+ (void)HideTabBar;

+ (void)DisplayTabBar;

+ (AppDelegate*)GetAppDelegate;

@end


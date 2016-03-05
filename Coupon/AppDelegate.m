//
//  AppDelegate.m
//  UCityFramework
//
//  Created by admin on 15/11/27.
//  Copyright © 2015年 XunHuan. All rights reserved.
//

#import "AppDelegate.h"
#import "CustomTabbarView.h"
#import "LoginViewController.h"
@interface AppDelegate ()

@property (strong, nonatomic) CustomTabbarViewController *tabBarVC;
@property (strong, nonatomic)AppMangerDelegate *appManager;


@end

AppDelegate *_appDelegate;

BOOL iscustomTabBarViewHide = NO;

@implementation AppDelegate

+ (AppDelegate *)GetAppDelegate {
    
    return _appDelegate;
}

+ (void)HideTabBar
{
    [_appDelegate.tabBarVC hideTabbar:YES];
}
+ (void)DisplayTabBar
{
    [_appDelegate.tabBarVC hideTabbar:NO];

}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.tabBarVC = [[CustomTabbarViewController alloc] init];
    LoginViewController *loginVC = [[LoginViewController alloc]init];
    self.window.rootViewController = self.tabBarVC;
    [self.window makeKeyAndVisible];
    _appDelegate = self;
    _appManager = [[AppMangerDelegate alloc]initWithDictionary:launchOptions];
    return YES;
}
#pragma mark --- appdelegate 方法

- (void)applicationWillResignActive:(UIApplication *)application {
     NSLog(@"应用程序将要进入非活动状态，即将进入后台");
    [_appManager applicationWillResignActive:application];
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    [_appManager applicationDidEnterBackground:application];
    NSLog(@"如果应用程序支持后台运行，则应用程序已经进入后台运行");
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    [_appManager applicationWillEnterForeground:application];
     NSLog(@"应用程序将要进入活动状态，即将进入前台运行");
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    [_appManager applicationDidBecomeActive:application];
     NSLog(@"应用程序已进入前台，处于活动状态");
}

- (void)applicationWillTerminate:(UIApplication *)application {
    [_appManager applicationWillTerminate:application];
    NSLog(@"应用程序将要退出，通常用于保存数据和一些退出前的清理工作");
}
-(void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    [_appManager applicationDidReceiveMemoryWarning:application];
    NSLog(@"系统内存不足，需要进行清理工作");
}

-(void)applicationSignificantTimeChange:(UIApplication *)application {
    [_appManager applicationSignificantTimeChange:application];
    NSLog(@"当系统时间发生改变时执行");
}

-(void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    NSLog(@"推送消息时，获取设备的tokenid%@",deviceToken);
}

- (void)application:(UIApplication *)app didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    NSLog(@"tokenid获取失败时,做相应处理 %@", [error description]);
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    //设置icon上的标记数字设置为0；
    //application.applicationIconBadgeNumber = 0;
    NSLog(@"接收到推送消息处理%@",userInfo);
}

-(void)applicationDidFinishLaunching:(UIApplication *)application {
    NSLog(@"当程序载入后执行");
}

@end

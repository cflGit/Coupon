//
//  AppMangerDelegate.h
//  framework_ios
//
//  Created by admin on 15/12/2.
//  Copyright © 2015年 XunHuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppMangerDelegate : NSObject

- (instancetype)initWithDictionary:(NSDictionary *)launchOption;
#pragma mark --- appdelegate 方法

//@"应用程序将要进入非活动状态，即将进入后台"
- (void)applicationWillResignActive:(UIApplication *)application;

//@"如果应用程序支持后台运行，则应用程序已经进入后台运行"
- (void)applicationDidEnterBackground:(UIApplication *)application;

//@"应用程序将要进入活动状态，即将进入前台运行"
- (void)applicationWillEnterForeground:(UIApplication *)application;

//@"应用程序已进入前台，处于活动状态"
- (void)applicationDidBecomeActive:(UIApplication *)application;

//@"应用程序将要退出，通常用于保存数据和一些退出前的清理工作"
- (void)applicationWillTerminate:(UIApplication *)application;

//@"系统内存不足，需要进行清理工作"
-(void)applicationDidReceiveMemoryWarning:(UIApplication *)application;

//@"当系统时间发生改变时执行"
-(void)applicationSignificantTimeChange:(UIApplication *)application;

//@"推送消息时，获取设备的tokenid%@"
-(void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken;

//(@"tokenid获取失败时,做相应处理 %@", [error description])
- (void)application:(UIApplication *)app didFailToRegisterForRemoteNotificationsWithError:(NSError *)error;

//@"接收到推送消息处理%@"
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo;

//@"当程序载入后执行"
-(void)applicationDidFinishLaunching:(UIApplication *)application;

@end

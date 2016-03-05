//
//  AppMangerDelegate.m
//  framework_ios
//
//  Created by admin on 15/12/2.
//  Copyright © 2015年 XunHuan. All rights reserved.
//

#import "AppMangerDelegate.h"

@implementation AppMangerDelegate

- (instancetype)initWithDictionary:(NSDictionary *)launchOption {
    if (self) {
        self = [super init];
        [self setReachability];
        [self updatePostion];
        /**
         *  键盘管理
         */
        IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
        manager.enable = YES;
        manager.shouldResignOnTouchOutside = YES;
//        manager.shouldToolbarUsesTextFieldTintColor = YES;
        manager.shouldShowTextFieldPlaceholder = NO;
        manager.enableAutoToolbar = YES;
    }
    return self;
}

#pragma mark --- appdelegate 方法

- (void)applicationWillResignActive:(UIApplication *)application {
    NSLog(@"应用程序将要进入非活动状态，即将进入后台");
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    NSLog(@"如果应用程序支持后台运行，则应用程序已经进入后台运行");
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    NSLog(@"应用程序将要进入活动状态，即将进入前台运行");
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    NSLog(@"应用程序已进入前台，处于活动状态");
}

- (void)applicationWillTerminate:(UIApplication *)application {
    NSLog(@"应用程序将要退出，通常用于保存数据和一些退出前的清理工作");
}
-(void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    
    NSLog(@"系统内存不足，需要进行清理工作");
}

-(void)applicationSignificantTimeChange:(UIApplication *)application {
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
#pragma mark --- 必要方法
/**
 *  网络监听
 */
- (void)setReachability {
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusNotReachable: {
                [JCAlertView showOneButtonWithTitle:@"提示" Message:@"网络中断" ButtonType:JCAlertViewButtonTypeDefault ButtonTitle:@"确定" Click:^{
                    NSLog(@"无网络");
                }];
                break;
            }
            case AFNetworkReachabilityStatusReachableViaWiFi:{
                NSLog(@"WiFi网络");
                [USER_DEFAULT setObject:@"WiFi" forKey:@"netType"];
                break;
            }
            case AFNetworkReachabilityStatusReachableViaWWAN:{
                [USER_DEFAULT setObject:@"3G/2G/4G" forKey:@"netType"];
                NSLog(@"无线网络");
                break;
            }
            default:
                break;
                
        }
    }];
}
#pragma mark - 定位
#pragma mark 更新用户自身位置
- (void)updatePostion {
    if ([self checkLocationIsValid]) {
        [[MMLocationManager shareLocation]startGetUserLocation:^(CLLocationCoordinate2D locationCorrrdinate) {
             NSString *_lon=[NSString stringWithFormat:@"%f",locationCorrrdinate.longitude];
             NSString *_lat=[NSString stringWithFormat:@"%f",locationCorrrdinate.latitude];
             [USER_DEFAULT setObject:_lon forKey:MMLastLongitude];
             [USER_DEFAULT setObject:_lat forKey:MMLastLatitude];
             NSLog(@"lon====%@---lat=====%@",[USER_DEFAULT objectForKey:MMLastLongitude],[USER_DEFAULT objectForKey:MMLastLatitude]);
         }];
    }
}
#pragma mark 是否开启定位功能
-(BOOL)checkLocationIsValid
{
    if ([CLLocationManager locationServicesEnabled] &&
        ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorized
         || [CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined)) {
            //定位功能可用，开始定位
            return YES;
        }
    else if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied){
        return NO;
    }
    return NO;
}

@end

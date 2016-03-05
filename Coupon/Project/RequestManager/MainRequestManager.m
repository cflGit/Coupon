//
//  MainRequestManager.m
//  UCityFramework
//
//  Created by admin on 15/11/29.
//  Copyright © 2015年 XunHuan. All rights reserved.
//

#import "MainRequestManager.h"

#define mianUrl @"index.php?act=index&op=index"

@interface MainRequestManager()
{
    MBProgressHUD *HUD;
}

@end

@implementation MainRequestManager

static MainRequestManager *defaultCenterInstance = nil;

+(MainRequestManager*)shareManager
{
    @synchronized(self) {
        static dispatch_once_t pred;
        dispatch_once(&pred, ^{
            defaultCenterInstance = [[self alloc] init];
        });
    }
    return defaultCenterInstance;
}

/**
 *  @brief  注册
 *  @param  params                  请求的参数 mobileNo
 *  @param  view                    在那一页上的请求
 *  @param  requestID               请求的ID
 *  @param  onFinishedBlock         请求完成的block，可以得到请求成功解析后的数组以及得到的数据个数，实现自己的逻辑
 *  @param  onFailedBlock           请求失败的的block，可以得到请求是失败后的错误，并实现自己的逻辑
 *  @return
 **/
-(void)requestRegisterWithParam:(NSMutableDictionary*)params
              withIndicatorView:(UIView*)view
            withCancelRequestID:(NSString*)requestID
                onRequestFinish:(void(^)(AFHTTPRequestOperation *operation))onFinishedBlock
                onRequestFailed:(void(^)(AFHTTPRequestOperation *operation ,NSError *error ))onFailedBlock {
    [super requestWithPath:mianUrl
              withParamDic:params
         withIndicatorView:view
           onRequestFinish:^(AFHTTPRequestOperation *operation) {
        onFinishedBlock(operation);
    }      onRequestFailed:^(AFHTTPRequestOperation *operation, NSError *error) {
        onFailedBlock (operation,error);

    }];
}
//上传图片
-(void)requestupdateImageWithParam:(NSMutableDictionary*)params
                    withImageArray:(NSMutableArray*)imageArray
                 withIndicatorView:(UIView*)view
               withCancelRequestID:(NSString*)requestID
                   onRequestFinish:(void(^)(AFHTTPRequestOperation *operation))onFinishedBlock
                   onRequestFailed:(void(^)(AFHTTPRequestOperation *operation ,NSError *error ))onFailedBlock {
    [super requestWithPath:nil
              withParamDic:params
            withImageArray:imageArray
         withIndicatorView:view
           onRequestFinish:^(AFHTTPRequestOperation *operation) {
               onFinishedBlock(operation);

    }      onRequestFailed:^(AFHTTPRequestOperation *operation, NSError *error) {
        onFailedBlock (operation,error);
    }];
}

@end

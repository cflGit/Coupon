//
//  BaseRequestManager.h
//  framework_ios
//
//  Created by admin on 15/12/2.
//  Copyright © 2015年 XunHuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#include <CommonCrypto/CommonCryptor.h>
#import "GTMBase64.h"

/**
 baseUrl 主要网站
 */
#define HostURL @"http://www.kanglt.com/mobile"

@interface BaseRequestManager : NSObject
/**
 *  单利创建
 *
 *  @return 返回一个单利
 */
+(BaseRequestManager*)shareManager;

-(void)requestWithPath:(NSString*)path
          withParamDic:(NSMutableDictionary*)param
     withIndicatorView:(UIView*)view
       onRequestFinish:(void(^)(AFHTTPRequestOperation *operation))onFinishedBlock
       onRequestFailed:(void(^)(AFHTTPRequestOperation *operation,NSError * error))onFailedBlock;
@end

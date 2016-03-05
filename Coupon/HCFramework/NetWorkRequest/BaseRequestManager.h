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
/**
 *  这是一个普通的网络请请求的基类
 *
 *  @param path            请求需要的URL
 *  @param param           请求参数
 *  @param view            请求蒙版
 *  @param onFinishedBlock 请求成功返回数据
 *  @param onFailedBlock   请求失败
 */
-(void)requestWithPath:(NSString*)path
          withParamDic:(NSMutableDictionary*)param
     withIndicatorView:(UIView*)view
       onRequestFinish:(void(^)(AFHTTPRequestOperation *operation))onFinishedBlock
       onRequestFailed:(void(^)(AFHTTPRequestOperation *operation,NSError * error))onFailedBlock;
/**
 *  这是一个上传图片的基类
 *
 *  @param path            请求需要的URL
 *  @param param           请求参数
 *  @param imageArray      上传所需照片的数组
 *  @param view            请求蒙版
 *  @param onFinishedBlock 请求成功返回数据
 *  @param onFailedBlock   请求失败
 */
-(void)requestWithPath:(NSString*)path
          withParamDic:(NSMutableDictionary*)param
        withImageArray:(NSMutableArray*)imageArray
     withIndicatorView:(UIView*)view
       onRequestFinish:(void(^)(AFHTTPRequestOperation *operation))onFinishedBlock
       onRequestFailed:(void(^)(AFHTTPRequestOperation *operation,NSError * error))onFailedBlock;

@end

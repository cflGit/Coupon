//
//  AFHTTPRequestOperation+HCAddition.h
//  framework_ios
//
//  Created by admin on 15/12/2.
//  Copyright © 2015年 XunHuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPRequestOperation.h"
@interface AFHTTPRequestOperation(HCAddition)
//业务上逻辑是否成功
-(BOOL)isSuccees;
//返回data数据
-(NSDictionary*)resultDic;
//返回说明
-(NSString*)message;

@end

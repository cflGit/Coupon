//
//  AFHTTPRequestOperation+HCAddition.m
//  framework_ios
//
//  Created by admin on 15/12/2.
//  Copyright © 2015年 XunHuan. All rights reserved.
//

#import "AFHTTPRequestOperation+HCAddition.h"

@implementation AFHTTPRequestOperation(HCAddition)
-(BOOL)isSuccees {
    NSDictionary * resultDic = [self dictionaryWithJsonString:self.responseString];
    if ([[resultDic objectForKey:@"code"] isEqual:@"200"]||[[resultDic objectForKey:@"code"]intValue] == 200) {
        return YES;
    }
    else {
        return NO;
    }
}

-(NSDictionary*)resultDic {
    NSDictionary * resultDic = [self dictionaryWithJsonString:self.responseString];
    return resultDic;
}

- (NSString*)message {
    NSDictionary * resultDic = [self dictionaryWithJsonString:self.responseString];
    NSObject* result=self.resultDic ;
    if ([[resultDic objectForKey:@"code"] isEqual:@"200"]) {
        
        if ([result isKindOfClass:[NSArray class]]) {
            return @"";
        }
        else if ([result isKindOfClass:[NSDictionary class]])
        {
            NSString * msgStr = [(NSDictionary*)result objectForKey:@"msg"];
            if (msgStr) {
                return [NSString stringWithFormat:@"%@",msgStr];
            }else {
                return @"";
            }
        }
        else
        {
            return @"";
        }
    }else {
        if ([result isKindOfClass:[NSArray class]]) {
            return @"";
        }
        else if ([result isKindOfClass:[NSDictionary class]])
        {
            NSString * msgStr = [(NSDictionary*)result objectForKey:@"error"];
            if (msgStr) {
                
                return [NSString stringWithFormat:@"%@",msgStr];
                
            }else
            {
                return @"";
            }
        }
        else
        {
            return @"";
        }
    }
}
- (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}
@end

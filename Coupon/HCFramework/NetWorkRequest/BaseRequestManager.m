//
//  BaseRequestManager.m
//  framework_ios
//
//  Created by admin on 15/12/2.
//  Copyright © 2015年 XunHuan. All rights reserved.
//

#import "BaseRequestManager.h"

@interface BaseRequestManager ()
{
    MBProgressHUD *MUB;
    
}
@property (nonatomic, strong) UIView *alphaV;
@property (nonatomic, strong) UIView *superView;

@end

@implementation BaseRequestManager
static BaseRequestManager *defaultCenterInstance = nil;
+(BaseRequestManager*)shareManager
{
    @synchronized(self) {
        static dispatch_once_t pred;
        dispatch_once(&pred, ^{
            defaultCenterInstance = [[self alloc] init];
        });
    }
    return defaultCenterInstance;
}

-(void)requestWithPath:(NSString*)path
          withParamDic:(NSMutableDictionary*)param
     withIndicatorView:(UIView*)view
       onRequestFinish:(void(^)(AFHTTPRequestOperation *operation))onFinishedBlock
       onRequestFailed:(void(^)(AFHTTPRequestOperation *operation,NSError * error))onFailedBlock{
    //对参数进行操作 加密操作1
    NSMutableDictionary * finalParam = [self getUrlBody:param];
    NSString *requestUrl = [NSString stringWithFormat:@"%@/%@",HostURL,path];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    // 设置请求格式
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    // 设置返回格式
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    if (view) {
        //添加一层蒙版
        if (!_alphaV) {
            _alphaV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
            _alphaV.backgroundColor = [UIColor clearColor];
            [view addSubview:_alphaV];
        }
        self.superView = view;
        MUB = [MBProgressHUD showHUDAddedTo:view animated:NO];
        MUB.alpha = 0.7;
        MUB.userInteractionEnabled = NO;
        MUB.labelFont=[UIFont boldSystemFontOfSize:15];
        MUB.yOffset=-10;
//        MUB.blur = NO;
        MUB.labelText = @"努力加载中";
    }
    [manager POST:requestUrl parameters:finalParam success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        onFinishedBlock (operation);
        [MBProgressHUD hideAllHUDsForView:view animated:YES];
        [_alphaV removeFromSuperview];
        
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        onFailedBlock(operation,error);
        [MBProgressHUD hideAllHUDsForView:view animated:YES];
        [_alphaV removeFromSuperview];
    }];
    
}
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
       onRequestFailed:(void(^)(AFHTTPRequestOperation *operation,NSError * error))onFailedBlock {
    //对参数进行操作 加密操作1
    NSMutableDictionary * finalParam = [self getUrlBody:param];
    NSString *requestUrl = [NSString stringWithFormat:@"%@/%@",HostURL,path];
    if (view) {
        //添加一层蒙版
        if (!_alphaV) {
            _alphaV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
            _alphaV.backgroundColor = [UIColor clearColor];
            [view addSubview:_alphaV];
        }
        self.superView = view;
        MUB = [MBProgressHUD showHUDAddedTo:view animated:NO];
        MUB.alpha = 0.7;
        MUB.userInteractionEnabled = NO;
        MUB.labelFont=[UIFont boldSystemFontOfSize:15];
        MUB.yOffset=-10;
        //        MUB.blur = NO;
        MUB.labelText = @"努力加载中";
    }
    AFHTTPRequestOperationManager* manger=[AFHTTPRequestOperationManager manager];
    //设置请求数据是json数据， 如果是json数据，则自动解析，这里设置为非json数据，得到data，为了写入数据库
    manger.responseSerializer=[AFHTTPResponseSerializer serializer];
    // 设置超时时间
    [manger.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manger.requestSerializer.timeoutInterval = 60.f;
    [manger.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    [manger POST:requestUrl parameters:finalParam constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        for (int i = 0; i<imageArray.count; i++) {
            NSData *data = UIImageJPEGRepresentation([imageArray objectAtIndex:i], 0.9);
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            formatter.dateFormat = @"yyyyMMddHHmmss";
            NSString *str = [formatter stringFromDate:[NSDate date]];
            NSString *fileName = [NSString stringWithFormat:@"%@.jpg", str];
            [formData appendPartWithFileData:data name:[NSString stringWithFormat:@"file%d",i] fileName:fileName mimeType:@"image/jpg"];
        }
        
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (onFinishedBlock) {
            onFinishedBlock(operation);
        }
        [MBProgressHUD hideAllHUDsForView:view animated:YES];
        [_alphaV removeFromSuperview];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (onFinishedBlock) {
            onFinishedBlock(operation);
        }
        [MBProgressHUD hideAllHUDsForView:view animated:YES];
        [_alphaV removeFromSuperview];
        NSLog(@"%@,%@",operation,error);
        
    }];

}

#pragma mark ---- 私有方法
-(NSMutableDictionary*)getUrlBody:(NSMutableDictionary*)dic {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *name = [[UIDevice currentDevice] name];
    NSArray *languages = [defaults objectForKey:@"AppleLanguages"];
    NSString *currentLanguage = [languages objectAtIndex:0];
    NSString *systemVersion = [[UIDevice currentDevice] systemVersion];
    NSString *appVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
    NSString *model = [[UIDevice currentDevice] model];
    NSString *appFrom = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"AppFrom"];
    NSString *deviceToken = [USER_DEFAULT objectForKey:@"device_token"];
    NSMutableString *rawPostString = [NSMutableString stringWithFormat:@"did=%@&_dname=%@&_requesttime=%.f&_language=%@&_version=%@&_appversion=%@&_model=%@&_systemtype=ios&userLat=%@&userLon=%@",[CommonHelp getUUIDFromKeychainItemWrapper],name,[[NSDate date] timeIntervalSince1970],currentLanguage,systemVersion,appVersion,model,[USER_DEFAULT objectForKey:MMLastLatitude],[USER_DEFAULT objectForKey:MMLastLongitude]];
    
    [rawPostString appendString:@"&_devicetoken="];
    if (deviceToken) {
        [rawPostString appendString:deviceToken];
    }
    
    [rawPostString appendString:@"&_from="];
    if (appFrom) {
        [rawPostString appendString:appFrom];
    }
    //网络环境
    NSString *network = [USER_DEFAULT objectForKey:@"netType"];
    [rawPostString appendString:@"&network="];
    if (network) {
        [rawPostString appendString:network];
    }
    
    [rawPostString appendString:@"&"];
    for (NSString *key in [dic allKeys]) {
        [rawPostString appendFormat:@"%@=%@&", key, [dic objectForKey:key]];
    }
    NSLog(@"postData=%@",rawPostString);
    NSString * poststring = [self encryptUseAES:rawPostString key:@"1%7jhs#Zjasd&tr*"];
    NSMutableDictionary* adic = [NSMutableDictionary dictionary];
    [adic safeString:poststring ForKey:@"vals"];
    return adic;
}
- (NSString *)encryptUseAES:(NSString *)clearText key:(NSString *)key {
    NSData *data = [clearText dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    unsigned char buffer[2048];
    memset(buffer, 0, sizeof(char));
    size_t numBytesEncrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt,
                                          kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding | kCCOptionECBMode,
                                          [key UTF8String],
                                          kCCKeySizeAES128,
                                          nil,
                                          [data bytes],
                                          [data length],
                                          buffer,
                                          2048,
                                          &numBytesEncrypted);
    NSString* plainText = nil;
    if (cryptStatus == kCCSuccess) {
        NSData *dataTemp = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesEncrypted];
        plainText = [GTMBase64 stringByEncodingData:dataTemp];
    }else{
        NSLog(@"AES加密失败");
    }
    return plainText;
}

@end

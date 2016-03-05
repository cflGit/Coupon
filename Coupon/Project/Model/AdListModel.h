//
//  AdListModel.h
//  framework_ios
//
//  Created by admin on 15/12/2.
//  Copyright © 2015年 XunHuan. All rights reserved.
//

#import "JSONModel.h"


@protocol AdListModel @end

@interface AdListModel : JSONModel

@property (nonatomic ,strong)NSString *adv_image_url;
@property (nonatomic ,strong)NSString *adv_name;
@property (nonatomic ,strong)NSString *adv_type;
@property (nonatomic ,strong)NSString *id;

@end

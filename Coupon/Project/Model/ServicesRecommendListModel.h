//
//  ServicesRecommendListModel.h
//  framework_ios
//
//  Created by admin on 15/12/2.
//  Copyright © 2015年 XunHuan. All rights reserved.
//

#import "JSONModel.h"

@protocol ServicesRecommendListModel @end

@interface ServicesRecommendListModel : JSONModel

@property (nonatomic ,strong)NSString *geval_scores;
@property (nonatomic ,strong)NSString *services_id;
@property (nonatomic ,strong)NSString *services_image;
@property (nonatomic ,strong)NSString *services_image_url;
@property (nonatomic ,strong)NSString *services_marketprice;
@property (nonatomic ,strong)NSString *services_name;
@property (nonatomic ,strong)NSString *services_price;
@property (nonatomic ,strong)NSString *services_salenum;
@property (nonatomic ,strong)NSString *services_time;
@property (nonatomic ,strong)NSString *services_type;
@property (nonatomic ,strong)NSString *store_id;
@property (nonatomic ,strong)NSString *store_name;

@end

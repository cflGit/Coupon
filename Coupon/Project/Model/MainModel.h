//
//  MainModel.h
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

@protocol GoodsRecommendListModel @end

@interface GoodsRecommendListModel : JSONModel

@property (nonatomic ,strong)NSString *geval_scores;
@property (nonatomic ,strong)NSString *goods_id;
@property (nonatomic ,strong)NSString *goods_image;
@property (nonatomic ,strong)NSString *goods_image_url;
@property (nonatomic ,strong)NSString *goods_marketprice;
@property (nonatomic ,strong)NSString *goods_name;
@property (nonatomic ,strong)NSString *goods_price;
@property (nonatomic ,strong)NSString *goods_salenum;
@property (nonatomic ,strong)NSString *is_activity;
@property (nonatomic ,strong)NSString *store_id;
@property (nonatomic ,strong)NSString *store_name;

@end

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

@interface MainModel : JSONModel

@property (nonatomic,strong)NSArray<AdListModel,ConvertOnDemand>*ad_list;

@property (nonatomic,strong)NSArray<GoodsRecommendListModel,ConvertOnDemand>*goods_recommend_list;

@property (nonatomic,strong)NSArray<ServicesRecommendListModel,ConvertOnDemand>*services_recommend_list;

@end
//
//  GoodsRecommendListModel.h
//  framework_ios
//
//  Created by admin on 15/12/2.
//  Copyright © 2015年 XunHuan. All rights reserved.
//

#import "JSONModel.h"
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

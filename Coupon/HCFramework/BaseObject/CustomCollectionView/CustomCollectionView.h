//
//  CustomCollectionView.h
//  framework_ios
//
//  Created by admin on 15/11/30.
//  Copyright © 2015年 XunHuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CustomCollectionView;

@protocol HCCollectionViewDelegate <NSObject>

@optional

/**
 *  触发时，刷新--- 在执行这个代理方法  请求数据结束之后 需要手动调用endNetTable
 *
 *  @param ittTableView
 */
-(void)pullCollectionViewDIdTriggerRefresh:(CustomCollectionView *)ittCollectionView;

/**
 *  触发时加载更多    请求数据结束之后  需要手动调用 endNetTable
 *
 *  @param ittTableView
 */
-(void)pullCollectionViewDIdTriggerLoadMore:(CustomCollectionView *)ittCollectionView;


@end

@interface CustomCollectionView : UICollectionView

@property(nonatomic,strong)id<HCCollectionViewDelegate>hcCollectionDelegate;
/**
 *  添加刷新
 */
- (void)setupRefresh;
/**
 *  结束刷新
 */
- (void) endNetTable;

@end

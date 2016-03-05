//
//  CustomCollectionView.m
//  framework_ios
//
//  Created by admin on 15/11/30.
//  Copyright © 2015年 XunHuan. All rights reserved.
//

#import "CustomCollectionView.h"

@implementation CustomCollectionView

/**
 *  集成刷新控件
 */
- (void)setupRefresh {
    __weak CustomCollectionView *weakSelf = self;
    // 下拉刷新
    self.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        // 进入刷新状态后会自动调用这个block
        [weakSelf headerRereshing];
    }];
    // 上拉刷新
    self.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        // 进入刷新状态后会自动调用这个block
        [weakSelf headerRereshing];
    }];
}

#pragma mark 开始进入刷新状态
- (void)headerRereshing {
    if (self.hcCollectionDelegate && [self.hcCollectionDelegate respondsToSelector:@selector(pullCollectionViewDIdTriggerRefresh:)]) {
        [self.hcCollectionDelegate pullCollectionViewDIdTriggerRefresh:self];
    }
}

- (void)footerRereshing {
    if (self.hcCollectionDelegate && [self.hcCollectionDelegate respondsToSelector:@selector(pullCollectionViewDIdTriggerLoadMore:)]) {
        [self.hcCollectionDelegate pullCollectionViewDIdTriggerLoadMore:self];
    }
}

-(void)endNetTable {
    [self.mj_header endRefreshing];
    [self.mj_footer endRefreshing];
}

@end

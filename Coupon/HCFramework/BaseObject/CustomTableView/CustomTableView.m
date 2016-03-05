//
//  CustomTableView.m
//  framework_ios
//
//  Created by admin on 15/11/30.
//  Copyright © 2015年 XunHuan. All rights reserved.
//

#import "CustomTableView.h"

@implementation CustomTableView

/**
 *  集成刷新控件
 */
- (void)setupRefresh {
    __weak CustomTableView *weakSelf = self;
    //添加下拉刷新
    self.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf headerRereshing];
    }];
    //添加下拉加载
    self.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [weakSelf footerRereshing];
    }];
}


#pragma mark 开始进入刷新状态
- (void)headerRereshing {
    if (self.hcTableViewDelegate && [self.hcTableViewDelegate respondsToSelector:@selector(pullTableViewDIdTriggerRefresh:)]) {
        [self.hcTableViewDelegate pullTableViewDIdTriggerRefresh:self];
    }
}

- (void)footerRereshing {
    if (self.hcTableViewDelegate && [self.hcTableViewDelegate respondsToSelector:@selector(pullTableViewDIdTriggerLoadMore:)]) {
        [self.hcTableViewDelegate pullTableViewDIdTriggerLoadMore:self];
    }
}

-(void)endNetTable {
    [self.mj_header endRefreshing];
    [self.mj_footer endRefreshing];
}


@end

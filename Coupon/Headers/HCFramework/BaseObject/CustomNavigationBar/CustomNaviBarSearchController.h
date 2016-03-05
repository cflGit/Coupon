//
//  CustomNaviBarSearchController.h
//  CustomNavigationBarDemo
//
//  Created by mac on 14-1-6.
//  Copyright (c) 2015年 XunHuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CustomViewController;
@class CustomNaviBarSearchController;

@protocol CustomNaviBarSearchControllerDelegate <NSObject>
/**
 *  点击搜索事件触发的方法
 *
 *  @param ctrl 搜索核心类
 *  @param strKeyword 关键字
 */
- (void)naviBarSearchCtrl:(CustomNaviBarSearchController *)ctrl searchKeyword:(NSString *)strKeyword;
/**
 *  点击取消的时候出发的方法
 *
 *  @param ctrl 搜索核心类
 */
- (void)naviBarSearchCtrlCancel:(CustomNaviBarSearchController *)ctrl;

@optional
/**
 *  清空搜索记录
 *
 *  @param ctrl 搜索核心类
 */
- (void)naviBarSearchCtrlClearKeywordRecord:(CustomNaviBarSearchController *)ctrl;

@end


@interface CustomNaviBarSearchController : NSObject

@property (unsafe_unretained) id<CustomNaviBarSearchControllerDelegate> delegate;
/**
 *  初始化一个导航栏上的搜索框
 *
 *  @param viewCtrl 搜索核心类
 *
 *  @return 返回一个搜索框
 */
- (id)initWithParentViewCtrl:(CustomViewController *)viewCtrl;
/**
 *  设置搜索框的占位描述
 *
 *  @param strMsg 展位描述
 */
- (void)resetPlaceHolder:(NSString *)strMsg;

// 导航条上的关键字输入框分两种
/**
 *  1、由按钮触发，点击按钮后显示输入框，结束后销毁输入框现实按钮。
 */
- (void)showTempSearchCtrl;


/**
 *  2、导航条一直显示输入框。
 */
- (void)showFixationSearchCtrl;
/**
 *  导航栏一直显示输入框
 */
- (void)showFixationSearchCtrlOnTitleView;
/**
 *  开始搜索
 */
- (void)startSearch;
/**
 *  移除搜索框
 */
- (void)removeSearchCtrl;
/**
 *  设置搜索记录
 *
 *  @param arrRecentKeyword 搜索记录数组
 */
- (void)setRecentKeyword:(NSArray *)arrRecentKeyword;
/**
 *  设置搜索关键字
 *
 *  @param strKeyword 关键字
 */
- (void)setKeyword:(NSString *)strKeyword;


@end

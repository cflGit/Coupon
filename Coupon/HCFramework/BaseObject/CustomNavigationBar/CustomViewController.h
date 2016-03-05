//
//  CustomViewController.h
//  CustomNavigationBarDemo
//
//  Created by admin on 14-1-6.
//  Copyright (c) 2015年 XunHuan. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum
{
    UIButtonStyleRight,//右侧按钮
    UIButtonStyleLeft,//返回
} UIButtonStyle;

@interface CustomViewController : UIViewController
/**
 *  把导航栏放到最上面
 */
- (void)bringNaviBarToTopmost;
/**
 *  显示导航栏设置
 *
 *  @param bIsHide 是否显示
 */
- (void)hideNaviBar:(BOOL)bIsHide;
/**
 *  设置导航栏标题
 *
 *  @param strTitle 标题字符串
 */
- (void)setNaviBarTitle:(NSString *)strTitle;
/**
 *  设置导航栏左边按钮
 *
 *  @param btn 按钮
 */
- (void)setNaviBarLeftBtn:(UIButton *)btn;
/**
 *  设置导航栏左边按钮
 *
 *  @param btn 按钮
 */
- (void)setNaviBarRightBtn:(UIButton *)btn;
/**
 *  自定义导航栏试图
 *
 *  @param view 试图
 */
- (void)naviBarAddCoverView:(UIView *)view;
/**
 *  自定义替换标题试图
 *
 *  @param view 试图
 */
- (void)naviBarAddCoverViewOnTitleView:(UIView *)view;
/**
 *  移除某个子试图
 *
 *  @param view 试图
 */
- (void)naviBarRemoveCoverView:(UIView *)view;
/**
 *  是否可右滑返回
 *
 *  @param bCanDragBack 条件
 */
- (void)navigationCanDragBack:(BOOL)bCanDragBack;
/**
 *  左边导航栏上的按钮关联的触发方法
 *
 *  @param sender 按钮
 */
- (void)leftBarButtonClick:(UIButton *)sender;
/**
 *  右边导航栏上的按钮关联的触发方法
 *
 *  @return 按钮
 */
-(void)rightBarButtonClick:(UIButton *)button;
/**
 *  设置导航栏上的按钮
 *
 *  @param style     分为左边按钮 右边按钮
 *  @param image     normal 状态下的image
 *  @param highImage 高亮状态下的image
 */
-(void)setButtonStyle:(UIButtonStyle)style andImage:(NSString *)imageStr highImage:(NSString *)highImageStr;

/**
 *  设置导航栏上的字体
 *
 *  @param style     分为左边按钮 右边按钮
 *  @param image     normal 状态下的image
 *  @param highImage 高亮状态下的image
 */
-(void)setButtonStyle:(UIButtonStyle)style andTitle:(NSString *)titleStr titleColor:(UIColor *)titleColor;



#pragma mark - 键盘事件
/****************键盘事件************************/
//如果开启此功能 则VieController 会自动监听键盘弹起事件 自动将编辑中的view拖动到可见区域
-(void)enableKeyboardManger;    /*default enabled*/
//禁用自动托起功能
-(void)disableKeyboardManager;

-(BOOL) isEnableKeyboardManger;

//结束编辑退出软键盘
-(void) endEditing;
//键盘弹起通知
- (void)keyboardWillShow:(NSNotification *)notification;
//键盘退出通知
- (void)keyboardWillHide:(NSNotification *)notification;


@end

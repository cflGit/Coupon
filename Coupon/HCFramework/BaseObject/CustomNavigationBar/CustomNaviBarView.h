//
//  CustomNaviBarView.h
//  CustomNavigationBarDemo
//
//  Created by mac on 14-1-6.
//  Copyright (c) 2015年 XunHuan. All rights reserved.
//

#import <UIKit/UIKit.h>
//导航栏背景色
#define NavBarBackGroundColor [UIColor colorWithHexString:@"54d395"]
//导航栏字体的颜色
#define NavBarTitleColor [UIColor whiteColor]

@interface CustomNaviBarView : UIView
/**
 *  弹出的搜索记录控制器
 */
@property (nonatomic, weak) UIViewController *m_viewCtrlParent;
@property (nonatomic, readonly) BOOL m_bIsCurrStateMiniMode;

/**
 *  设置右边按钮的frame
 *
 *  @return 返回右按钮的frame
 */
+ (CGRect)rightBtnFrame;
/**
 *  设置导航栏按钮的大小
 *
 *  @return 返回导航栏按钮的大小
 */
+ (CGSize)barBtnSize;
/**
 *  设置导航栏按钮的frame
 *
 *  @return 返回导航栏的frame
 */
+ (CGSize)barSize;
/**
 *  设置导航栏头试图的frame
 *
 *  @return 返回导航栏头试图的frame
 */
+ (CGRect)titleViewFrame;

/**
 *  // 创建一个导航条按钮：使用默认的按钮图片。
 *
 *  @param strTitle 按钮文字
 *  @param target   按钮控制对象
 *  @param action   按钮事件
 *
 *  @return 返回定制按钮
 */
+ (UIButton *)createNormalNaviBarBtnByTitle:(NSString *)strTitle target:(id)target action:(SEL)action;

/**
 *  创建一个导航条按钮：自定义按钮图片。
 *
 *  @param strImg          按钮默认图片
 *  @param strImgHighlight 按钮高亮的图片
 *  @param target          按钮控制对象
 *  @param action          按钮事件
 *
 *  @return 返回定制按钮
 */
+ (UIButton *)createImgNaviBarBtnByImgNormal:(NSString *)strImg imgHighlight:(NSString *)strImgHighlight target:(id)target action:(SEL)action;
/**
 *  创建一个导航条按钮：自定义按钮图片。
 *
 *  @param strImg          按钮默认图片
 *  @param strImgHighlight 按钮高亮的图片
 *  @param strImgSelected  按钮被选中的图片
 *  @param target          按钮控制对象
 *  @param action          按钮事件
 *
 *  @return 返回定制按钮
 */
+ (UIButton *)createImgNaviBarBtnByImgNormal:(NSString *)strImg imgHighlight:(NSString *)strImgHighlight imgSelected:(NSString *)strImgSelected target:(id)target action:(SEL)action;
/**
 *  设置导航栏上的左边的按钮
 *
 *  @param btn 设置按钮
 */
- (void)setLeftBtn:(UIButton *)btn;
/**
 *  设置导航栏上的右边边的按钮
 *
 *  @param btn 设置按钮
 */
- (void)setRightBtn:(UIButton *)btn;
/**
 *  设置导航栏上的标题
 *
 *  @param strTitle 设置标题
 */
- (void)setTitle:(NSString *)strTitle;

// 在导航条上覆盖一层自定义视图。比如：输入搜索关键字时，覆盖一个输入框在上面。
- (void)showCoverView:(UIView *)view;
- (void)showCoverView:(UIView *)view animation:(BOOL)bIsAnimation;
- (void)showCoverViewOnTitleView:(UIView *)view;
- (void)hideCoverView:(UIView *)view;



@end

//
//  tabbarViewController.m
//  tabbarTest
//
//  Created by Kevin Lee on 13-5-6.
//  Copyright (c) 2013年 Kevin. All rights reserved.
//

#import "CustomTabbarViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "CustomTabbarView.h"

#define SELECTED_VIEW_CONTROLLER_TAG 98456345

#define tabbarHight 49

@interface CustomTabbarViewController ()

@end

@implementation CustomTabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _tabbar = [[CustomTabbarView alloc]initWithFrame:CGRectMake(0,  [UIScreen mainScreen].bounds.size.height-tabbarHight, [UIScreen mainScreen].bounds.size.width,tabbarHight )];
    _tabbar.backgroundColor = [UIColor blackColor];
    _tabbar.alpha = 0.65;
    _tabbar.delegate = self;
    [self.view addSubview:_tabbar];
    _arrayViewcontrollers = [self getViewcontrollers];
    [self touchBtnAtIndex:0];
    
    for(UIView *view in self.view.subviews){
        if([view isKindOfClass:[UITabBar class]]){
            view.alpha = 0;
            break;
        }
    }
    [self showOriginalTabBar];
}

- (void)showOriginalTabBar{
    UIView *contentView;
    if ([[self.view.subviews objectAtIndex:0] isKindOfClass:[UITabBar class]] ) {
        contentView = [self.view.subviews objectAtIndex:1];
    }
    else {
        contentView = [self.view.subviews objectAtIndex:0];
    }
    contentView.frameheight = SCREEN_HEIGHT;
}

- (void)hideTabbar:(BOOL)hide {
    if (hide) {
        [UIView animateWithDuration:0.3 animations:^{
            _tabbar.frametop = SCREEN_HEIGHT;
        }];
    }else {
        [UIView animateWithDuration:0.3 animations:^{
            _tabbar.frametop = SCREEN_HEIGHT-tabbarHight;
        }];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)touchBtnAtIndex:(NSInteger)index {
    UIView* currentView = [self.view viewWithTag:SELECTED_VIEW_CONTROLLER_TAG];
    [currentView removeFromSuperview];
    UIViewController *viewController = [_arrayViewcontrollers objectAtIndex:index];
    viewController.view.tag = SELECTED_VIEW_CONTROLLER_TAG;
    viewController.view.frame = CGRectMake(0,0,self.view.frame.size.width, self.view.frame.size.height);
    [self.view insertSubview:viewController.view belowSubview:_tabbar];
}

-(NSArray *)getViewcontrollers {
    FirstViewController *first = [[FirstViewController alloc]init];
    SecondViewController *second = [[SecondViewController alloc]init];
    ThirdViewController *third = [[ThirdViewController alloc]init];
    CustomNavigationController *firstNav = [[CustomNavigationController alloc]initWithRootViewController:first];
    CustomNavigationController *secondNav = [[CustomNavigationController alloc]initWithRootViewController:second];
    CustomNavigationController *thirdNav = [[CustomNavigationController alloc]initWithRootViewController:third];
    NSArray *tabBarItems = @[firstNav,secondNav,thirdNav];
    return tabBarItems;
}

@end

//
//  CouponPreviewViewController.m
//  Coupon
//
//  Created by admin on 15/12/12.
//  Copyright © 2015年 XunHuan. All rights reserved.
//

#import "CouponPreviewViewController.h"

@interface CouponPreviewViewController ()

@end

@implementation CouponPreviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNaviBarTitle:@"体验券预览"];    // 设置标题
    [self setButtonStyle:UIButtonStyleLeft andImage:@"search_back.png" highImage:nil];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [AppDelegate HideTabBar];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

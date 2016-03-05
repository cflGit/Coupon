//
//  CreatCouponViewController.m
//  Coupon
//
//  Created by admin on 15/12/10.
//  Copyright © 2015年 XunHuan. All rights reserved.
//

#import "CreatCouponViewController.h"
#import "CouponPreviewViewController.h"
@interface CreatCouponViewController ()

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *toplay;

@end

@implementation CreatCouponViewController
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [AppDelegate HideTabBar];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNaviBarTitle:@"创建体验券"];    // 设置标题
    [self setButtonStyle:UIButtonStyleLeft andImage:@"search_back.png" highImage:nil];
    
    [self setButtonStyle:UIButtonStyleRight andTitle:@"预览" titleColor:[UIColor whiteColor]];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)rightBarButtonClick:(UIButton *)button {
    CouponPreviewViewController *oreviewVC = [[CouponPreviewViewController alloc]init];
    [self.navigationController pushViewController:oreviewVC animated:YES];
    
}
- (IBAction)allAction:(UIButton *)sender {
}
@end

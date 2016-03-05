//
//  RD_MyAddressViewController.m
//  Coupon
//
//  Created by 王建军 on 15/12/10.
//  Copyright © 2015年 XunHuan. All rights reserved.
//

#import "RD_MyAddressViewController.h"

@interface RD_MyAddressViewController ()

@end

@implementation RD_MyAddressViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self setNaviBarTitle:@"地址"];    // 设置标题
    [self setButtonStyle:UIButtonStyleLeft andImage:@"search_back.png" highImage:nil];
    [self setButtonStyle:UIButtonStyleRight andImage:@"保存" highImage:@""];
    
    // Do any additional setup after loading the view from its nib.
    
}



#pragma mark - Init



#pragma mark - Network



#pragma mark - Delegate



#pragma mark - Action


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

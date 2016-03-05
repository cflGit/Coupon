//
//  RD_MySystemSetViewController.m
//  Coupon
//
//  Created by 王建军 on 15/12/10.
//  Copyright © 2015年 XunHuan. All rights reserved.
//

#import "RD_MySystemSetViewController.h"

@interface RD_MySystemSetViewController ()

@end

@implementation RD_MySystemSetViewController

#pragma mark - Life cycle

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self setNaviBarTitle:@"系统设置"];    // 设置标题

    [self setButtonStyle:UIButtonStyleLeft andImage:@"search_back.png" highImage:nil];
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

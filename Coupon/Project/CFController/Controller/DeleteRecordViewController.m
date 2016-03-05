//
//  DeleteRecordViewController.m
//  Coupon
//
//  Created by admin on 15/12/11.
//  Copyright © 2015年 XunHuan. All rights reserved.
//

#import "DeleteRecordViewController.h"

@interface DeleteRecordViewController ()

@end

@implementation DeleteRecordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNaviBarTitle:@"体验券核销记录"];    // 设置标题
    [self setButtonStyle:UIButtonStyleLeft andImage:@"search_back.png" highImage:nil];

}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [AppDelegate HideTabBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end

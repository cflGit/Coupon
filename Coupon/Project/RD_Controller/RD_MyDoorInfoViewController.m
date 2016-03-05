//
//  RD_MyDoorInfoViewController.m
//  Coupon
//
//  Created by 王建军 on 15/12/10.
//  Copyright © 2015年 XunHuan. All rights reserved.
//

#import "RD_MyDoorInfoViewController.h"
#import "RD_MyTelephoneViewController.h"
#import "RD_MyTimeViewController.h"
#import "RD_MyProjectViewController.h"
#import "RD_MyAddressViewController.h"


@interface RD_MyDoorInfoViewController ()

@end

@implementation RD_MyDoorInfoViewController

#pragma mark - Life cycle

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self setNaviBarTitle:@"门店信息"];    // 设置标题
    [self setButtonStyle:UIButtonStyleLeft andImage:@"search_back.png" highImage:nil];
    [self setButtonStyle:UIButtonStyleRight andImage:@"保存" highImage:@""];
    // Do any additional setup after loading the view from its nib.
    
}



#pragma mark - Init



#pragma mark - Network



#pragma mark - Delegate



#pragma mark - Action

- (IBAction)clickButton:(UIButton *)sender {
    switch (sender.tag) {
        case 1000://"地址",
        {
            [self.navigationController pushViewController:[[RD_MyAddressViewController alloc] init] animated:YES];
        }
            break;
        case 1001://@"电话",
        {
            RD_MyTelephoneViewController *tel =  [[RD_MyTelephoneViewController alloc] init];
            tel.titleText = @"联系人电话";
            tel.textPlacehoder = @"输入门店固话或者联系人手机可用“，”隔开";
            [self.navigationController pushViewController:tel animated:YES];        }
            break;
        case 1002://@"联系人"
        {
            
            RD_MyTelephoneViewController *people =  [[RD_MyTelephoneViewController alloc] init];
            people.textPlacehoder = @"输入联系姓名";
            people.titleText = @"联系人";
            [self.navigationController pushViewController:people animated:YES];
        }
            break;
        case 1003://"营业时间",
        {
            [self.navigationController pushViewController:[[RD_MyTimeViewController alloc] init] animated:YES];
        }
            break;
        case 1004://@"经营项目",
        {
            [self.navigationController pushViewController:[[RD_MyProjectViewController alloc] init] animated:YES];
        }
            break;
        case 1005://@"会员数"
        {
            RD_MyTelephoneViewController *people =  [[RD_MyTelephoneViewController alloc] init];
            people.textPlacehoder = @"输入粉丝数/会员数";
            people.titleText = @"粉丝数/会员数";
            [self.navigationController pushViewController:people animated:YES];
        }
            break;
        default:
            break;
    }
}


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

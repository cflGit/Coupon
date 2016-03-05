//
//  AddChannelViewController.m
//  Coupon
//
//  Created by admin on 15/12/11.
//  Copyright © 2015年 XunHuan. All rights reserved.
//

#import "AddChannelViewController.h"
#import "SelectMerchantViewController.h"
@interface AddChannelViewController ()<UIActionSheetDelegate>

@end

@implementation AddChannelViewController
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [AppDelegate HideTabBar];
}


- (void)viewDidLoad {
    [super viewDidLoad];

    [self setNaviBarTitle:@"添加发放渠道"];    // 设置标题
    [self setButtonStyle:UIButtonStyleLeft andImage:@"search_back.png" highImage:nil];

    [self setButtonStyle:UIButtonStyleRight andTitle:@"完成" titleColor:nil];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)addChannelAction:(UIButton *)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:nil
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"门店微信群",@"合作商户",@"其他", nil];//UIActionSheet初始化，并设置delegate
    actionSheet.actionSheetStyle = UIActionSheetStyleDefault;
    [actionSheet showFromRect:self.view.bounds inView:self.view animated:YES]; // actionSheet弹出位置
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
}

-(void)rightBarButtonClick:(UIButton *)button {

}
//选择商户
- (IBAction)selectShanghu:(UIButton *)sender {
    SelectMerchantViewController *selectVC = [[SelectMerchantViewController alloc]init];
    [self.navigationController pushViewController:selectVC animated:YES];
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

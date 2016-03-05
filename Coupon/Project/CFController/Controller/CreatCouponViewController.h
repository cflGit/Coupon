//
//  CreatCouponViewController.h
//  Coupon创建体验券控制器
//
//  Created by admin on 15/12/10.
//  Copyright © 2015年 XunHuan. All rights reserved.
//

#import "CustomViewController.h"

@interface CreatCouponViewController : CustomViewController
- (IBAction)allAction:(UIButton *)sender;

@property (strong, nonatomic) IBOutlet UISwitch *isfenxiang;
@property (strong, nonatomic) IBOutlet UILabel *biaotiLabel;
@property (strong, nonatomic) IBOutlet UILabel *xiangmuLabel;

@property (strong, nonatomic) IBOutlet UITextField *jiazhiTextField;
@property (strong, nonatomic) IBOutlet UILabel *youxiaoqilabel;
@property (strong, nonatomic) IBOutlet UILabel *keyongLabel;
@property (strong, nonatomic) IBOutlet UILabel *riqiLabel;
@property (strong, nonatomic) IBOutlet UILabel *shiduanLabel;

@property (strong, nonatomic) IBOutlet UILabel *shuliangLabel;
@property (strong, nonatomic) IBOutlet UILabel *guizeLabel;
@property (strong, nonatomic) IBOutlet UILabel *xuanchuanLabel;

@end

//
//  OwnCouponCell.h
//  Coupon
//
//  Created by admin on 15/12/10.
//  Copyright © 2015年 XunHuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OwnCouponCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *titleNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *timeLabel;
@property (strong, nonatomic) IBOutlet UIView *firstView;
@property (strong, nonatomic) IBOutlet UIView *secondView;
@property (strong, nonatomic) IBOutlet UIView *thridView;
@property (strong, nonatomic) IBOutlet UIButton *firstBtn;
@property (strong, nonatomic) IBOutlet UIButton *secondBtn;
@property (strong, nonatomic) IBOutlet UIButton *thridBtn;
@property (strong, nonatomic) IBOutlet UIButton *fourBtn;

@property (strong, nonatomic) IBOutlet UILabel *firstViewlabel;
@property (strong, nonatomic) IBOutlet UILabel *secondViewlabel;
@property (strong, nonatomic) IBOutlet UILabel *thirdViewlabel;
@property (strong, nonatomic) IBOutlet UIImageView *yitingfaImage;

@property (strong, nonatomic) IBOutlet UIButton *secondViewBtn;
@property (strong, nonatomic) IBOutlet UIButton *thridViewBtn;

@end

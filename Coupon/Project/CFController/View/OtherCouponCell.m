//
//  OtherCouponCell.m
//  Coupon
//
//  Created by admin on 15/12/10.
//  Copyright © 2015年 XunHuan. All rights reserved.
//

#import "OtherCouponCell.h"

@implementation OtherCouponCell

- (void)awakeFromNib {
    [_firstView setBorderWidth:1 andBorderColor:[UIColor colorWithHexString:@"54d395"]];
    [_firstView makeCornerRadius:8];
    
    [_secondView setBorderWidth:1 andBorderColor:[UIColor colorWithHexString:@"54d395"]];
    [_secondView makeCornerRadius:8];
    
    [_thridView setBorderWidth:1 andBorderColor:[UIColor colorWithHexString:@"54d395"]];
    [_thridView makeCornerRadius:8];
    
    [_firstBtn makeCornerRadius:8];
    
    [_secondBtn makeCornerRadius:8];
    
    [_thridBtn makeCornerRadius:8];
    
    [_fourBtn makeCornerRadius:8];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

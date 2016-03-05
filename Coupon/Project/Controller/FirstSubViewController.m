//
//  FirstSubViewController.m
//  Coupon
//
//  Created by admin on 15/12/10.
//  Copyright © 2015年 XunHuan. All rights reserved.
//

#import "FirstSubViewController.h"
#import "OwnCouponCell.h"
#import "OtherCouponCell.h"
#import "CreatCouponViewController.h"
#import "ForwardViewController.h"
#import "GetRecordViewController.h"
#import "DeleteRecordViewController.h"
@interface FirstSubViewController ()<HCTableViewDelegate,UITableViewDataSource,UITableViewDelegate>

@property (nonatomic ,strong)CustomTableView *tableView;

@end

@implementation FirstSubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    _tableView = [[CustomTableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-(NaviBarHeight+20+30+20+TabBarHeight)) style:UITableViewStyleGrouped];
    _tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    if (self.type == 1) {
        _tableView.rowHeight = 120;

    }else {
        _tableView.rowHeight = 150;
    }
    [self hideNaviBar:YES];
    [self.view addSubview:_tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 12;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 0.01;
    }
    return 0.01;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.type == 1) {
        OwnCouponCell *cell = [tableView dequeueReusableCellWithIdentifier:@"owncell"];
        if (cell == nil) {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"OwnCouponCell" owner:self options:nil]firstObject];
        }
        cell.tag = indexPath.section+1000;
        [cell.secondViewBtn addTarget:self action:@selector(lingquliangAction:) forControlEvents:UIControlEventTouchUpInside];
        [cell.thridViewBtn addTarget:self action:@selector(hexiaoliangAction:) forControlEvents:UIControlEventTouchUpInside];
        [cell.firstBtn addTarget:self action:@selector(allBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        [cell.secondBtn addTarget:self action:@selector(allBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        [cell.thridBtn addTarget:self action:@selector(allBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        [cell.fourBtn addTarget:self action:@selector(allBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else {
        OtherCouponCell *cell = [tableView dequeueReusableCellWithIdentifier:@"othercell"];
        if (cell == nil) {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"OtherCouponCell" owner:self options:nil]firstObject];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;

    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
#pragma mark---Action
- (void)lingquliangAction:(UIButton *)sender {
    GetRecordViewController *getVC = [[GetRecordViewController alloc]init];
    [self.navigationController pushViewController:getVC animated:YES];
    
}
- (void)hexiaoliangAction:(UIButton *)sender {
    DeleteRecordViewController *deleteVC = [[DeleteRecordViewController alloc]init];
    [self.navigationController pushViewController:deleteVC animated:YES];
    
}
- (void)allBtnAction:(UIButton *)sender {
    OwnCouponCell *cell;
    if (IS_IOS8) {
        cell = (OwnCouponCell *)sender.superview.superview.superview;
    }else {
        cell = (OwnCouponCell *)sender.superview.superview.superview.superview;
    }
    
    NSIndexPath * row = [_tableView indexPathForCell:cell];

    if ([sender.titleLabel.text isEqualToString:@"修改"]) {
        CreatCouponViewController *creatVC = [[CreatCouponViewController alloc]init];
        [self.navigationController pushViewController:creatVC animated:YES];
    }
    
    if ([sender.titleLabel.text isEqualToString:@"转发"]) {
        ForwardViewController *forwardVC = [[ForwardViewController alloc]init];
        [self.navigationController pushViewController:forwardVC animated:YES];
    }
    if ([sender.titleLabel.text isEqualToString:@"修改"]) {
        
    }
    if ([sender.titleLabel.text isEqualToString:@"停发"]) {
        
    }
    if ([sender.titleLabel.text isEqualToString:@"启用"]) {
        
    }
    if ([sender.titleLabel.text isEqualToString:@"复制"]) {
        CreatCouponViewController *creatVC = [[CreatCouponViewController alloc]init];
        [self.navigationController pushViewController:creatVC animated:YES];

        
    }

}
@end

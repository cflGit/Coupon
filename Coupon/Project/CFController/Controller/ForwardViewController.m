//
//  ForwardViewController.m
//  Coupon
//
//  Created by admin on 15/12/11.
//  Copyright © 2015年 XunHuan. All rights reserved.
//

#import "ForwardViewController.h"
#import "ForwardCell.h"
#import "AddChannelViewController.h"
@interface ForwardViewController ()<HCTableViewDelegate,UITableViewDataSource,UITableViewDelegate>

@property (nonatomic ,strong)CustomTableView *tableView;

@end

@implementation ForwardViewController
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [AppDelegate HideTabBar];
}


//添加发放渠道
- (IBAction)tianjiafafangqudaoAction:(UIButton *)sender {
    AddChannelViewController *addVC = [[AddChannelViewController alloc]init];
    [self.navigationController pushViewController:addVC animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setNaviBarTitle:@"转发渠道"];    // 设置标题
    [self setButtonStyle:UIButtonStyleLeft andImage:@"search_back.png" highImage:nil];

    _tableView = [[CustomTableView alloc]initWithFrame:CGRectMake(0, 100, SCREEN_WIDTH, SCREEN_HEIGHT-(100)) style:UITableViewStyleGrouped];
    _tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 110;
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
    
        ForwardCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ForwardCell"];
        if (cell == nil) {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"ForwardCell" owner:self options:nil]firstObject];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
        
}

@end

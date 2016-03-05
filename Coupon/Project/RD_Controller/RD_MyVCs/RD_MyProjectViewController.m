//
//  RD_MyProjectViewController.m
//  Coupon
//
//  Created by 王建军 on 15/12/10.
//  Copyright © 2015年 XunHuan. All rights reserved.
//

#import "RD_MyProjectViewController.h"
#import "RD_ProjectTableViewCell.h"

@interface RD_MyProjectViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSArray *dataArray; //数据源


@end

@implementation RD_MyProjectViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self setNaviBarTitle:@"经营项目"];    // 设置标题
    [self setButtonStyle:UIButtonStyleLeft andImage:@"search_back.png" highImage:nil];
    [self setButtonStyle:UIButtonStyleRight andImage:@"保存" highImage:@""];
    
    [self loadData];
    
    [self tableViewInit];
    
    // Do any additional setup after loading the view from its nib.
    
}



#pragma mark - Init

- (void)tableViewInit {
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
}
#pragma mark - Network

- (void)loadData {
    _dataArray = @[@"门店信息",@"店员管理",@"系统设置"];
}

#pragma mark - Delegate
#pragma mark - TableView Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return 70;
//    //    UITableViewCell *cell = [self tableView:_tableView cellForRowAtIndexPath:indexPath];
//    //    return cell.frame.size.height;
//}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:  (NSIndexPath *)indexPath {
    static NSString *InfoCellIndetifier = @"cellIndentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:InfoCellIndetifier];
    if (!cell) {
        cell = [[RD_ProjectTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:InfoCellIndetifier];
    }
    if (_dataArray.count !=0) {
        cell.textLabel.text = _dataArray[indexPath.row];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0://"门店信息",
        {
            
        }
            break;
        case 1://@"店员管理",
        {
            
        }
            break;
        case 2://@"系统设置"
        {
            
        }
            break;
            
        default:
            break;
    }
}

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

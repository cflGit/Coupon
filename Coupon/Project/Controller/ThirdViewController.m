//
//  ThirdViewController.m
//  UCityFramework
//
//  Created by admin on 15/11/27.
//  Copyright © 2015年 XunHuan. All rights reserved.
//

#import "ThirdViewController.h"
#import "RD_MyClerkManageViewController.h"
#import "RD_MyDoorInfoViewController.h"
#import "RD_MySystemSetViewController.h"


@interface ThirdViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSArray *dataArray; //数据源


@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNaviBarTitle:@"系统设置"];    // 设置标题
    [self setNaviBarLeftBtn:nil];       // 若不需要默认的返回按钮，直接赋nil
    
    
    [self loadData];
    
    [self tableViewInit];

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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
        return 70;
//    UITableViewCell *cell = [self tableView:_tableView cellForRowAtIndexPath:indexPath];
//    return cell.frame.size.height;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:  (NSIndexPath *)indexPath {
    static NSString *InfoCellIndetifier = @"cellIndentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:InfoCellIndetifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:InfoCellIndetifier];
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

- (IBAction)clickButton:(UIButton *)sender {
    switch (sender.tag) {
        case 1000://"门店信息",
        {
            [self.navigationController pushViewController:[[RD_MyDoorInfoViewController alloc] init] animated:YES];
        }
            break;
        case 1001://@"店员管理",
        {
             [self.navigationController pushViewController:[[RD_MyClerkManageViewController alloc] init] animated:YES];
        }
            break;
        case 1002://@"系统设置"
        {
              [self.navigationController pushViewController:[[RD_MySystemSetViewController alloc] init] animated:YES];
        }
            break;
            
        default:
            break;
    }
}

//"门店信息",

//@"店员管理",

//@"系统设置"

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end

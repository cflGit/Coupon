//
//  GetRecordViewController.m
//  Coupon
//
//  Created by admin on 15/12/11.
//  Copyright © 2015年 XunHuan. All rights reserved.
//

#import "GetRecordViewController.h"
#import "SpreadHeadView.h"
#import "GetRecordCell.h"
#import "GetRecordPopView.h"
@interface GetRecordViewController ()<HCTableViewDelegate,UITableViewDataSource,UITableViewDelegate,HeadViewDelegate>
{
    NSInteger _currentSection;
    NSInteger _currentRow;

}

@property (nonatomic ,strong)CustomTableView *tableView;
@property(nonatomic, strong) NSMutableArray* headViewArray;

@property (nonatomic ,strong)GetRecordPopView *customView;
@property (nonatomic ,strong)JCAlertView *customAlert;


@end

@implementation GetRecordViewController
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [AppDelegate HideTabBar];
}
- (void)cancelAction:(UIButton *)sender {
    [_customAlert dismissWithCompletion:nil];
}
- (void)quedingAction:(UIButton *)sender {
    [_customAlert dismissWithCompletion:nil];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    _customView = [[NSBundle mainBundle]loadNibNamed:@"GetRecordPopView" owner:self options:nil].firstObject;
    [_customView.cancelBtn addTarget:self action:@selector(cancelAction:) forControlEvents:UIControlEventTouchUpInside];
    [_customView.okBtn addTarget:self action:@selector(quedingAction:) forControlEvents:UIControlEventTouchUpInside];
    
    _customView.frame = CGRectMake(0, 0, 300, 177);
    _customAlert = [[JCAlertView alloc] initWithCustomView:_customView dismissWhenTouchedBackground:YES];

    [self setNaviBarTitle:@"体验券领取记录"];    // 设置标题
    [self setButtonStyle:UIButtonStyleLeft andImage:@"search_back.png" highImage:nil];
    [self setButtonStyle:UIButtonStyleRight andImage:@"search_back.png" highImage:nil];
    
    [self loadModel];
    
    _tableView = [[CustomTableView alloc]initWithFrame:CGRectMake(0, 120, SCREEN_WIDTH, SCREEN_HEIGHT-(120)) style:UITableViewStyleGrouped];
    _tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}
- (void)loadModel{
    _currentRow = -1;
    self.headViewArray = [[NSMutableArray alloc]init ];
    for(int i = 0;i< 5 ;i++) {
        SpreadHeadView* headview = [[SpreadHeadView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 45.5)];
        headview.delegate = self;
        headview.section = i;
        [headview.backBtn setTitle:[NSString stringWithFormat:@"第%d组",i] forState:UIControlStateNormal];
        headview.backgroundColor = [UIColor whiteColor];
        [self.headViewArray addObject:headview];
    }
}
#pragma mark - TableViewdelegate&&TableViewdataSource

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    SpreadHeadView* headView = [self.headViewArray objectAtIndex:indexPath.section];
    
    return headView.open?78:0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 45;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}


- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [self.headViewArray objectAtIndex:section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    SpreadHeadView* headView = [self.headViewArray objectAtIndex:section];
    return headView.open?5:0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [self.headViewArray count];
}



- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *indentifier = @"cell";
    GetRecordCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"GetRecordCell" owner:self options:nil]firstObject];
        UIButton* backBtn=  [[UIButton alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 45)];
        backBtn.tag = 20000;
        [backBtn setBackgroundImage:[UIImage imageNamed:@"btn_on"] forState:UIControlStateHighlighted];
        backBtn.userInteractionEnabled = NO;
        [cell.contentView addSubview:backBtn];
    }
    UIButton* backBtn = (UIButton*)[cell.contentView viewWithTag:20000];
    SpreadHeadView* view = [self.headViewArray objectAtIndex:indexPath.section];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"btn_2_nomal"] forState:UIControlStateNormal];
    
    if (view.open) {
        if (indexPath.row == _currentRow) {
            [backBtn setBackgroundImage:[UIImage imageNamed:@"btn_nomal"] forState:UIControlStateNormal];
        }
    }
    cell.textLabel.textColor = [UIColor blackColor];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    _currentRow = indexPath.row;
    [_tableView reloadData];
}


#pragma mark - HeadViewdelegate
-(void)selectedWith:(SpreadHeadView *)view{
    _currentRow = -1;
    if (view.open) {
        for(int i = 0;i<[self.headViewArray count];i++)
        {
            SpreadHeadView *head = [self.headViewArray objectAtIndex:i];
            head.open = NO;
            [head.backBtn setBackgroundImage:[UIImage imageNamed:@"btn_momal"] forState:UIControlStateNormal];
        }
        [_tableView reloadData];
        return;
    }
    _currentSection = view.section;
    [self reset];
    
}

//界面重置
- (void)reset
{
    for(int i = 0;i<[self.headViewArray count];i++)
    {
        SpreadHeadView *head = [self.headViewArray objectAtIndex:i];
        
        if(head.section == _currentSection)
        {
            head.open = YES;
            [head.backBtn setBackgroundImage:[UIImage imageNamed:@"btn_nomal"] forState:UIControlStateNormal];
            
        }else {
            [head.backBtn setBackgroundImage:[UIImage imageNamed:@"btn_momal"] forState:UIControlStateNormal];
            
            head.open = NO;
        }
        
    }
    [_tableView reloadData];
}

-(void)rightBarButtonClick:(UIButton *)button {
    [_customAlert show];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end

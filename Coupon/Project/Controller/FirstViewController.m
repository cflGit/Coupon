//
//  FirstViewController.m
//  UCityFramework
//
//  Created by admin on 15/11/27.
//  Copyright © 2015年 XunHuan. All rights reserved.
//

#import "FirstViewController.h"
#import "MainRequestManager.h"
#import "MainModel.h"
#import "LoginViewController.h"
#import "HMSegmentedControl.h"
#import "FirstSubViewController.h"
#import "CreatCouponViewController.h"
@interface FirstViewController ()
{
    FirstSubViewController *ownerVC;
    FirstSubViewController *otherVC;

}
@property (nonatomic,strong)UIScrollView *shopScrollView;
//数据源
@property (strong, nonatomic)NSMutableArray *dataArray;
@property (nonatomic ,strong)UILabel *titleLabel;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNaviBarTitle:@"爱发券"];    // 设置标题
    [self setNaviBarLeftBtn:nil];       // 若不需要默认的返回按钮，直接赋nil
    [self setButtonStyle:UIButtonStyleRight andImage:@"tianjiaanniu.png" highImage:@"tianjiaanniu.png"];
    
     _titleLabel= [[UILabel alloc]initWithFrame:CGRectMake(0, 65, SCREEN_WIDTH, 30)];
    _titleLabel.backgroundColor = [UIColor whiteColor];
    _titleLabel.textColor = [UIColor colorWithHexString:@"54d395"];
    _titleLabel.text = @"       ·商托斯总部";
    [self.view addSubview:_titleLabel];
    [self configTableView];
    
}
- (void)configTableView {
    HMSegmentedControl *segmentedControl = [[HMSegmentedControl alloc] initWithSectionTitles:@[@"自家的券", @"代发的券"]];
    segmentedControl.selectionIndicatorBoxOpacity=1;
    
    segmentedControl.backgroundColor = [UIColor colorWithHexString:@"54d395"];
    segmentedControl.layer.masksToBounds = YES;
    segmentedControl.layer.cornerRadius = 8;
    [segmentedControl setFrame:CGRectMake((SCREEN_WIDTH-250)/2, 64+10+30, 250, 30)];
    [segmentedControl setSelectionIndicatorColor:[UIColor whiteColor]];
    [segmentedControl setSelectionIndicatorLocation:HMSegmentedControlSelectionIndicatorLocationDown];
    [segmentedControl setSelectionIndicatorHeight:0.0f];
    NSDictionary *defaults = @{
                               NSFontAttributeName : [UIFont systemFontOfSize:14.0f],
                               NSForegroundColorAttributeName : [UIColor whiteColor],
                               };
    segmentedControl.titleTextAttributes = defaults;
    
    NSDictionary *selectDefaults =@{
                                    NSFontAttributeName : [UIFont systemFontOfSize:14.0f],
                                    NSForegroundColorAttributeName : [UIColor colorWithHexString:@"54d395"],
                                    };
    segmentedControl.selectedTitleTextAttributes = selectDefaults;
    segmentedControl.selectionStyle = HMSegmentedControlSelectionStyleBox;
    segmentedControl.borderType = HMSegmentedControlBorderTypeRight;
    segmentedControl.borderColor = [UIColor groupTableViewBackgroundColor];
    [segmentedControl addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:segmentedControl];


    _shopScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64+30+10+30+10, SCREEN_WIDTH, SCREEN_HEIGHT-(64+30+10+30+10+TabBarHeight))];
    _shopScrollView.scrollEnabled = NO;
    _shopScrollView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_shopScrollView];
    [self addView2Page:_shopScrollView count:2 frame:CGRectZero];
}
/**
 *  添加试图方法
 */
- (void)addView2Page:(UIScrollView *)scrollV count:(NSUInteger)pageCount frame:(CGRect)frame
{
    for (int i = 0; i < pageCount; i++)
    {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(scrollV.frame.size.width * i, 0, scrollV.frame.size.width, scrollV.frame.size.height)];
        view.tag = i + 1;
        view.userInteractionEnabled = YES;
        [self initPageView:view];
        [scrollV addSubview:view];
    }
    [scrollV setContentSize:CGSizeMake(scrollV.frame.size.width * pageCount, scrollV.frame.size.height)];
}
/**
 *  初始化视图
 *
 *  @param view View
 */
- (void)initPageView:(UIView *)view
{
    switch (view.tag)
    {
        case 1: //全部
        {
            ownerVC = [[FirstSubViewController alloc]init];
            ownerVC.type =1;
            [view addSubview:ownerVC.view];
            [self addChildViewController:ownerVC];
        }
            break;
        case 2://待确认
        {
            otherVC = [[FirstSubViewController alloc]init];
            otherVC.type =2;
            [view addSubview:otherVC.view];
            [self addChildViewController:otherVC];
            
        }
            break;
        default:
            break;
    }
}

- (void)segmentedControlChangedValue:(HMSegmentedControl *)segmentedControl {
    [_shopScrollView scrollRectToVisible:CGRectMake(_shopScrollView.frame.size.width * (segmentedControl.selectedSegmentIndex), _shopScrollView.frame.origin.y, _shopScrollView.frame.size.width, _shopScrollView.frame.size.height) animated:YES];
    switch (segmentedControl.selectedSegmentIndex) {
        case 0: //全部
        {
            [ownerVC viewWillAppear:YES];
        }
            break;
        case 1://待确认
        {
            [otherVC viewWillAppear:YES];
            
        }
            break;
        default:
            break;
    }
}


- (void)rightBarButtonClick:(UIButton *)button {
    CreatCouponViewController *creatVC = [[CreatCouponViewController alloc]init];
    [self.navigationController pushViewController:creatVC animated:YES];
}

@end

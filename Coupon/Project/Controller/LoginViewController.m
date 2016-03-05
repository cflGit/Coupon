//
//  LoginViewController.m
//  Coupon
//
//  Created by admin on 15/12/10.
//  Copyright © 2015年 XunHuan. All rights reserved.
//

#import "LoginViewController.h"
#import "CustomTabbarViewController.h"

@interface LoginViewController ()
@property (strong, nonatomic) IBOutlet UIView *storeView;
@property (strong, nonatomic) IBOutlet UIView *acountView;
@property (strong, nonatomic) IBOutlet UIView *pwView;
@property (strong, nonatomic) IBOutlet UITextField *storeTextFiled;
@property (strong, nonatomic) IBOutlet UITextField *acountTextFiled;
@property (strong, nonatomic) IBOutlet UITextField *pwTextFiled;
@property (strong, nonatomic) IBOutlet UIButton *loginAction;

@end

@implementation LoginViewController

- (IBAction)loginAction:(UIButton *)sender {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_storeView setBorderWidth:1 andBorderColor:[UIColor groupTableViewBackgroundColor]];
    [_storeView makeCornerRadius:4];
    
    [_acountView setBorderWidth:1 andBorderColor:[UIColor groupTableViewBackgroundColor]];
    [_acountView makeCornerRadius:4];
    
    [_pwView setBorderWidth:1 andBorderColor:[UIColor groupTableViewBackgroundColor]];
    [_pwView makeCornerRadius:4];

    
    UIButton *bi = [UIButton buttonWithType:UIButtonTypeCustom];
    bi.backgroundColor = [UIColor redColor];
    bi.frame = CGRectMake(0, 0, 100, 100);
    [bi addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bi];
}

- (void)click:(UIButton *)sender {
    CustomTabbarViewController *tabbarVC = [[CustomTabbarViewController alloc]init];
    self.view.window.rootViewController = tabbarVC;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

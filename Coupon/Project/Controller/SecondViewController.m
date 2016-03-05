//
//  SecondViewController.m
//  UCityFramework
//
//  Created by admin on 15/11/27.
//  Copyright © 2015年 XunHuan. All rights reserved.
//

#import "SecondViewController.h"
#import "QRCodeReaderViewController.h"
@interface SecondViewController ()<QRCodeReaderDelegate>

@property (strong, nonatomic) IBOutlet UISearchBar *searbarView;
@property (strong, nonatomic) IBOutlet UIButton *searchBtn;
@property (strong, nonatomic)QRCodeReaderViewController *reader;

@end

@implementation SecondViewController

- (IBAction)searchAction:(UIButton *)sender {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNaviBarTitle:@"体验券核销"];    // 设置标题
    [self setNaviBarLeftBtn:nil];       // 若不需要默认的返回按钮，直接赋nil
    [self setButtonStyle:UIButtonStyleRight andImage:@"tianjiaanniu" highImage:@"tianjiaanniu"];
    self.searbarView.keyboardType =UIKeyboardTypeNumberPad;
    [self setQRcodeReader];
}
- (void)setQRcodeReader {
    _reader = [QRCodeReaderViewController new];
    UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelBtn.frame = CGRectMake(10, 20, 50, 40);
    [cancelBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [cancelBtn setTitle:@"返回" forState:UIControlStateNormal];
    [cancelBtn addTarget:self action:@selector(cancelAction:) forControlEvents:UIControlEventTouchUpInside];
    [_reader.view addSubview:cancelBtn];
    
    _reader.modalPresentationStyle = UIModalPresentationFormSheet;
    _reader.delegate = self;
    __weak typeof (UIViewController*) weakRead = _reader;
    [_reader setCompletionWithBlock:^(NSString *resultAsString) {
        NSLog(@"^^二维码^^^^   %@",resultAsString);
        [weakRead dismissViewControllerAnimated:YES completion:nil];
    }];

}

- (void)rightBarButtonClick:(UIButton *)button {
    [self presentViewController:_reader animated:YES completion:NULL];
}

- (void)cancelAction:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end

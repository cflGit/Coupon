//
//  CustomViewController.m
//  CustomNavigationBarDemo
//
//  Created by jimple on 14-1-6.
//  Copyright (c) 2014年 Jimple Chen. All rights reserved.
//

#import "CustomViewController.h"
#import "CustomNaviBarView.h"
#import "CustomNavigationController.h"

@interface CustomViewController ()
{
    UIView            *_editingTextFieldOrTextView;
    float             _contentViewTop;
    id                 _textViewOrFieldOrgDelegate;



}

@property (nonatomic, readonly) CustomNaviBarView *m_viewNaviBar;

@end

@implementation CustomViewController
@synthesize m_viewNaviBar = _viewNaviBar;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        self.wantsFullScreenLayout = YES;
        
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.wantsFullScreenLayout = YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:238/255.0f green:238/255.0f blue:238/255.0f alpha:1];
    _viewNaviBar = [[CustomNaviBarView alloc] initWithFrame:Rect(0.0f, 0.0f, [CustomNaviBarView barSize].width, [CustomNaviBarView barSize].height)];
    _viewNaviBar.m_viewCtrlParent = self;
    [self.view addSubview:_viewNaviBar];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [UtilityFunc cancelPerformRequestAndNotification:self];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (_viewNaviBar && !_viewNaviBar.hidden)
    {
        [self.view bringSubviewToFront:_viewNaviBar];
    }else{}
}

#pragma mark -

- (void)bringNaviBarToTopmost
{
    if (_viewNaviBar)
    {
        [self.view bringSubviewToFront:_viewNaviBar];
    }else{
    
    }
}

- (void)hideNaviBar:(BOOL)bIsHide
{
    _viewNaviBar.hidden = bIsHide;

}

- (void)setNaviBarTitle:(NSString *)strTitle
{
    if (_viewNaviBar)
    {
        [_viewNaviBar setTitle:strTitle];
    }else{APP_ASSERT_STOP}
}

- (void)setNaviBarLeftBtn:(UIButton *)btn
{
    if (_viewNaviBar)
    {
        [_viewNaviBar setLeftBtn:btn];
    }else{APP_ASSERT_STOP}
}

- (void)setNaviBarRightBtn:(UIButton *)btn
{
    if (_viewNaviBar)
    {
        [_viewNaviBar setRightBtn:btn];
    }else{APP_ASSERT_STOP}
}

- (void)naviBarAddCoverView:(UIView *)view
{
    if (_viewNaviBar && view)
    {
        [_viewNaviBar showCoverView:view animation:YES];
    }else{}
}

- (void)naviBarAddCoverViewOnTitleView:(UIView *)view
{
    if (_viewNaviBar && view)
    {
        [_viewNaviBar showCoverViewOnTitleView:view];
    }else{}
}

- (void)naviBarRemoveCoverView:(UIView *)view
{
    if (_viewNaviBar)
    {
        [_viewNaviBar hideCoverView:view];
    }else{
    
    }
}

// 是否可右滑返回
- (void)navigationCanDragBack:(BOOL)bCanDragBack
{
    if (self.navigationController)
    {
        [((CustomNavigationController *)(self.navigationController)) navigationCanDragBack:bCanDragBack];
    }else{
    
    }
}

/**
 *  左边导航栏上的按钮关联的触发方法
 *
 *  @param sender 按钮
 */
- (void)leftBarButtonClick:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
/**
 *  右边导航栏上的按钮关联的触发方法
 *
 *  @return 按钮
 */
-(void)rightBarButtonClick:(UIButton *)button {
    
}
/**
 *  设置导航栏上的按钮
 *
 *  @param style     分为左边按钮 右边按钮
 *  @param image     normal 状态下的image
 *  @param highImage 高亮状态下的image
 */
-(void)setButtonStyle:(UIButtonStyle)style andImage:(NSString *)imageStr highImage:(NSString *)highImageStr {
    
    if (style == UIButtonStyleLeft) {
     UIButton *leftBtn  =   [CustomNaviBarView createImgNaviBarBtnByImgNormal:imageStr imgHighlight:highImageStr target:self action:@selector(leftBarButtonClick:)];
        [self setNaviBarLeftBtn:leftBtn];
    }else {
        UIButton *rightBtn  =   [CustomNaviBarView createImgNaviBarBtnByImgNormal:imageStr imgHighlight:highImageStr target:self action:@selector(rightBarButtonClick:)];
        [self setNaviBarRightBtn:rightBtn];

    }
}
#pragma mark  键盘事件
///////////////////////////////////////////////////////////////////////////////

-(BOOL)isEnableKeyboardManger
{
    return YES;
}

-(void)enableKeyboardManger
{
    
    if (![self isEnableKeyboardManger])
    {
        return;
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    /*Registering for textField notification*/
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(textFieldDidBeginEditingNotification:)
                                                 name:UITextFieldTextDidBeginEditingNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(textFieldDidEndEditingNotification:)
                                                 name:UITextFieldTextDidEndEditingNotification
                                               object:nil];
    
    /*Registering for textView notification*/
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(textFieldDidBeginEditingNotification:)
                                                 name:UITextViewTextDidBeginEditingNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(textFieldDidEndEditingNotification:)
                                                 name:UITextViewTextDidEndEditingNotification
                                               object:nil];
    
}

-(void)disableKeyboardManager
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)setContentViewTop:(float)contentViewTop
{
    self.view.frametop = contentViewTop;
    _contentViewTop = contentViewTop;
}

-(void)keyboardWillShow:(NSNotification *)notification
{
    
    NSLog(@"keyboardWillShow=%@",_editingTextFieldOrTextView);
    
    if (!_editingTextFieldOrTextView)
    {
        return;
    }
    /*
     获取通知携带的信息
     */
    NSDictionary *userInfo = [notification userInfo];
    
    // Get the origin of the keyboard when it's displayed.
    NSValue* aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    // Get the top of the keyboard as the y coordinate of its origin in self's view's coordinate system. The bottom of the text view's frame should align with the top of the keyboard's final position.
    CGRect keyboardRect = [aValue CGRectValue];
    keyboardRect = [self.view convertRect:keyboardRect toView:self.view];
    
    CGRect textViewRect =  [_editingTextFieldOrTextView.superview convertRect:_editingTextFieldOrTextView.frame toView:self.view];
    
    
    float offsetY  = (textViewRect.origin.y + textViewRect.size.height) - keyboardRect.origin.y;
    
    //输入框未被键盘遮挡 无需调整
    if (offsetY <=0)
    {
        return;
    }
    
    //  offsetY += IOS_VERSION_CODE < IOS_SDK_7 ? 44 :0;
    
    //获取键盘的动画执行时长
    NSValue *animationDurationValue = [userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration;
    [animationDurationValue getValue:&animationDuration];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:animationDuration];
    
    self.view.frametop = -keyboardRect.size.height;
    
    [UIView commitAnimations];
}


-(void)keyboardWillHide:(NSNotification *)notification
{
    
    NSDictionary* userInfo = [notification userInfo];
    
    /*
     Restore the size of the text view (fill self's view).
     Animate the resize so that it's in sync with the disappearance of the keyboard.
     */
    NSValue *animationDurationValue = [userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration;
    [animationDurationValue getValue:&animationDuration];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:animationDuration];
    
    self.view.frametop = 0;
    
    [UIView commitAnimations];
}

#pragma mark - UITextField Delegate methods
//Fetching UITextField object from notification.
-(void)textFieldDidBeginEditingNotification:(NSNotification *) notification
{
    _editingTextFieldOrTextView = notification.object;
    if ([_editingTextFieldOrTextView isKindOfClass:[UITextField class]])
    {
        //        UITextField *textFiled = (UITextField *)_editingTextFieldOrTextView;
        //        _textViewOrFieldOrgDelegate = textFiled.delegate;
        //        [textFiled setDelegate:self];
    }else if ([_editingTextFieldOrTextView isKindOfClass:[UITextView class]]) {
        
        //        TextView写死高度 键盘
        CGRect textViewRect =  [_editingTextFieldOrTextView convertRect:_editingTextFieldOrTextView.frame toView:self.view];
        
        
        if (textViewRect.origin.y + textViewRect.size.height < SCREEN_HEIGHT - 216)
        {
            return;
        }
        float offsetY  =  (textViewRect.origin.y - 216);
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.25];
        if (offsetY+ 20>=0) {
            self.view.frametop = -216;
        }
        
        [UIView commitAnimations];
    }
}

//Removing fetched object.
-(void)textFieldDidEndEditingNotification:(NSNotification*)notification
{
    if ([_editingTextFieldOrTextView isKindOfClass:[UITextField class]])
    {
        //        UITextField *textFiled = (UITextField *)_editingTextFieldOrTextView;
        //        [textFiled setDelegate:_textViewOrFieldOrgDelegate];
        
    }
    
    [_editingTextFieldOrTextView resignFirstResponder];
    _editingTextFieldOrTextView = nil;
    _textViewOrFieldOrgDelegate =nil;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self endEditing];
    return YES;
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self endEditing];
}


- (void)endEditing
{
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
}


@end

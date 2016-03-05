//
//  tabbarView.m
//  tabbarTest
//
//  Created by Kevin Lee on 13-5-6.
//  Copyright (c) 2013年 Kevin. All rights reserved.
//

#import "CustomTabbarView.h"
//#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

@implementation CustomTabbarView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setFrame:frame];
        [self layoutBtn];
    }
    return self;
}

-(void)layoutBtn
{
    _button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    _button1.selected = YES;
    [_button1 setImage:[UIImage imageNamed:@"shouye2.png"] forState:UIControlStateNormal];
    [_button1 setImage:[UIImage imageNamed:@"shouye1.png"] forState:UIControlStateSelected];

    [_button1 setFrame:CGRectMake(0, 0, SCREEN_WIDTH/4, self.frame.size.height)];
    [_button1 setTag:101];
    [_button1 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    _button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [_button2 setImage:[UIImage imageNamed:@"activity.png"] forState:UIControlStateNormal];
    [_button2 setImage:[UIImage imageNamed:@"activity2.png"] forState:UIControlStateSelected];
    [_button2 setFrame:CGRectMake(SCREEN_WIDTH/4, 0, SCREEN_WIDTH/4, self.frame.size.height)];
    [_button2 setTag:102];
    [_button2 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    _button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [_button3 setImage:[UIImage imageNamed:@"shopping.png"] forState:UIControlStateNormal];
    [_button3 setImage:[UIImage imageNamed:@"shopping2.png"] forState:UIControlStateSelected];
    [_button3 setFrame:CGRectMake(SCREEN_WIDTH/4*2, 0, SCREEN_WIDTH/4, self.frame.size.height)];
    [_button3 setTag:103];
    [_button3 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    _button4 = [UIButton buttonWithType:UIButtonTypeCustom];
    [_button4 setFrame:CGRectMake(SCREEN_WIDTH/4*3, 0, SCREEN_WIDTH/4, self.frame.size.height)];
    [_button4 setImage:[UIImage imageNamed:@"my.png"] forState:UIControlStateNormal];
    [_button4 setImage:[UIImage imageNamed:@"my2.png"] forState:UIControlStateSelected];
    [_button4 setTag:104];
    [_button4 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:_button1];
    [self addSubview:_button2];
    [self addSubview:_button3];
    [self addSubview:_button4];
    
}

-(void)btnClick:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    NSLog(@"%i",btn.tag);
    switch (btn.tag) {
        case 101:
        {
            if (!btn.selected) {
                [self.delegate touchBtnAtIndex:0];
            }

            _button1.selected = YES;
            _button2.selected = NO;
            _button3.selected = NO;
            _button4.selected = NO;
            break;
        }
        case 102:
        {
            if (!btn.selected) {
                [self.delegate touchBtnAtIndex:1];
            }

            _button1.selected = NO;
            _button2.selected = YES;
            _button3.selected = NO;
            _button4.selected = NO;
            break;
        }
        case 103:
        {
            if (!btn.selected) {
                [self.delegate touchBtnAtIndex:2];
            }
            _button1.selected = NO;
            _button2.selected = NO;
            _button3.selected = YES;
            _button4.selected = NO;
 
        }
            break;
        case 104:
        {
            if (!btn.selected) {
                [self.delegate touchBtnAtIndex:3];
            }
            _button1.selected = NO;
            _button2.selected = NO;
            _button3.selected = NO;
            _button4.selected = YES;
        }
            break;
        default:
            break;
    }
}

@end

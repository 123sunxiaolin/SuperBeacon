//
//  ForgetPswSecondViewController.m
//  SuperBeacon
//
//  Created by kys－1 on 15-5-1.
//  Copyright (c) 2015年 孙晓林. All rights reserved.
//

#import "ForgetPswSecondViewController.h"
#import "NINetworkImageView.h"
#import "UIView+Utils.h"
@interface ForgetPswSecondViewController ()
@property (weak, nonatomic) IBOutlet NINetworkImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UIView *pswBackgroundView;
@property (weak, nonatomic) IBOutlet UIView *confirmPswView;
@property (weak, nonatomic) IBOutlet UITextField *pswTextField;
@property (weak, nonatomic) IBOutlet UITextField *confirmTextField;
@property (weak, nonatomic) IBOutlet UIButton *finishedBtn;

@end

@implementation ForgetPswSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"新密码";
    [self setLeftNavButtonType:NavButtonBack];
    
    [_pswBackgroundView setCornerRadius:2 borderColor:HEXCOLOR(0xD7D7D7)];
    [_confirmPswView setCornerRadius:2 borderColor:HEXCOLOR(0xD7D7D7)];
    _pswBackgroundView.alpha = 0.8;
    _confirmPswView.alpha = 0.8;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [super touchesBegan:touches withEvent:event];
    [_pswTextField resignFirstResponder];
    [_confirmTextField resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

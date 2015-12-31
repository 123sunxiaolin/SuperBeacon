//
//  LoginViewController.m
//  SuperBeacon
//
//  Created by kys－1 on 15-4-30.
//  Copyright (c) 2015年 孙晓林. All rights reserved.
//

#import "LoginViewController.h"
#import "NINetworkImageView.h"
#import "UIButton+Utils.h"
#import "NSString+Utils.h"
#import "UIView+Toast.h"
#import "PKRevealController.h"
#import "RequestLogin.h"
#import "ResponseUser.h"
#import "UserManager.h"
#import "BusinessManager.h"
#import "MarketViewController.h"
#import "UIImage+Utils.h"

@interface LoginViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIView *backView;
@property (weak, nonatomic) IBOutlet NINetworkImageView *loginBackgroundImageView;
@property (weak, nonatomic) IBOutlet UIImageView *userInputImageView;
@property (weak, nonatomic) IBOutlet UIImageView *passwordImageView;
@property (weak, nonatomic) IBOutlet UITextField *userTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *forgetPswBtn;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"登录";
    [self setLeftNavButtonType:NavButtonMenu];
    
     _userInputImageView.alpha = 0.8;
    _passwordImageView.alpha = 0.8;
    [_forgetPswBtn setTitleColor:[UIColor redColor]];
    [_forgetPswBtn addTarget:self action:@selector(onClickForgetPassWordBtn:)];
    
    _loginBtn.alpha = 0.8;
    [_loginBtn setTitleColor:HEXCOLOR(0xF8356E)];
    [_loginBtn addTarget:self action:@selector(onClickLoginBtn:)];
    
    [_registerBtn addTarget:self action:@selector(onClickRegisterBtn:)];
    
    _userTextField.delegate = self;
    _passwordTextField.delegate = self;
    _userTextField.clearButtonMode = UITextFieldViewModeAlways;
    _passwordTextField.clearButtonMode = UITextFieldViewModeAlways;
    [_userTextField addTarget:self action:@selector(returnOnKeyboard:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [_passwordTextField addTarget:self action:@selector(returnOnKeyboard:) forControlEvents:UIControlEventEditingDidEndOnExit];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setTranslucent:YES];
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleLightContent;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor clearColor]] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    /*[self.navigationController setNavigationBarHidden:LAUNCH_MAIN_CONTROLLER ? YES : NO animated:YES];*/
}

- (void)onClickLoginBtn:(UIButton *)sender{
    T4_LOG_FUNC();
    NSString *mobile = _userTextField.text;
    NSString *password = _passwordTextField.text;
    if (![mobile validatePhone]) {
        [self.view makeToast:@"手机号码格式不正确"];
        return;
    }
    if (!password.length){
        [self.view makeToast:@"密码不能为空"];
        return;
    }
    [self.view makeToastActivity];
    RequestLogin *requestLogin = [[RequestLogin alloc] init];
    requestLogin.mobile = mobile;
    requestLogin.password = password;
    [[BusinessManager sharedInstance] post:requestLogin success:^(RequestBean *request, ResponseBean *response) {
         [[UserManager sharedInstance] setUserResponse:(ResponseUser *)response];
        [self.view hideToastActivity];
        [self.view makeToast:@"登陆成功"];
        MarketViewController *marketViewController = [[MarketViewController alloc]init];
        UINavigationController *front = [[UINavigationController alloc]initWithRootViewController:marketViewController];
        [self.revealController setFrontViewController:front];
        [self.revealController showViewController:self.revealController.frontViewController animated:YES completion:nil];
    } failure:^(RequestBean *request, NSInteger errorCode, NSString *message) {
        [self.view hideToastActivity];
        [self.view makeToast:[NSString stringWithFormat:@"%@", message]];
    }];

    
    
}

- (void)onClickRegisterBtn:(UIButton *)sender{
    T4_LOG_FUNC();
    [self showWithClassName:@"RegisterFirstViewController"];
    
}

- (void)onClickForgetPassWordBtn:(UIButton *)sender{
    T4_LOG_FUNC();
    
    [self showWithClassName:@"ForgetPswFirstViewController"];
}

#pragma mark ---------UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if (IS_IPHONE4) {
        NSTimeInterval animationDuration=0.30f;
        [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
        [UIView setAnimationDuration:animationDuration];
        
        CGFloat width = self.view.frame.size.width;
        CGFloat height = self.view.frame.size.height;
        
        CGFloat y = - 90;
        CGRect rect = CGRectMake(0.0f, y, width, height);
        self.view.frame = rect;
        
        [UIView commitAnimations];
    }
   
    
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    return YES;
}

- (void)resumeView
{
    NSTimeInterval animationDuration=0.30f;
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    CGFloat width = self.view.frame.size.width;
    CGFloat height = self.view.frame.size.height;
    CGFloat y = 0;
    CGRect rect = CGRectMake(0.0f, y, width, height);
    self.view.frame = rect;
    [UIView commitAnimations];
}

- (void)returnOnKeyboard:(UITextField *)sender
{
    if (sender == _userTextField) {
        [_passwordTextField becomeFirstResponder];
    }else if (sender == _passwordTextField) {
        
        [_userTextField resignFirstResponder];
        [_passwordTextField resignFirstResponder];
        [self resumeView];
        [self onClickLoginBtn:_loginBtn];
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [super touchesBegan:touches withEvent:event];
    [_userTextField resignFirstResponder];
    [_passwordTextField resignFirstResponder];
    
    if (IS_IPHONE4) {
        [self resumeView];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

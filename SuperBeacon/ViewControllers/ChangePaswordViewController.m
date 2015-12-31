//
//  ChangePaswordViewController.m
//  SuperBeacon
//
//  Created by kys－1 on 15-5-3.
//  Copyright (c) 2015年 孙晓林. All rights reserved.
//

#import "ChangePaswordViewController.h"
#import "UIView+Utils.h"
#import "UserManager.h"
#import "RequestChangePassword.h"
#import "BusinessManager.h"
#import "UIView+Toast.h"

@interface ChangePaswordViewController ()
@property (weak, nonatomic) IBOutlet UIView *oldPswBackView;
@property (weak, nonatomic) IBOutlet UITextField *oldPswTextField;
@property (weak, nonatomic) IBOutlet UIView *pswBackView;
@property (weak, nonatomic) IBOutlet UITextField *pswTextField;
@property (weak, nonatomic) IBOutlet UIView *confirmPswBackView;
@property (weak, nonatomic) IBOutlet UITextField *confirmPswTextField;

@end

@implementation ChangePaswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"重置密码";
    self.view.backgroundColor = HEXCOLOR(0xFAFAFA);
    [self setLeftNavButtonType:NavButtonBack];
    [self setRightNavButtonType:NavButtonDone];
    
    [_oldPswBackView setCornerRadius:0 borderColor:HEXCOLOR(0xD7D7D7) borderWidth:0.5];
    _oldPswBackView.alpha = 0.8;
    _oldPswTextField.clearButtonMode = UITextFieldViewModeAlways;
    [_pswBackView setCornerRadius:0 borderColor:HEXCOLOR(0xD7D7D7) borderWidth:0.5];
    _pswBackView.alpha = 0.8;
    _pswTextField.clearButtonMode = UITextFieldViewModeAlways;
    [_confirmPswBackView setCornerRadius:0 borderColor:HEXCOLOR(0xD7D7D7) borderWidth:0.5];
    _confirmPswBackView.alpha = 0.8;
    _confirmPswTextField.clearButtonMode = UITextFieldViewModeAlways;
    [_oldPswTextField becomeFirstResponder];
    
}

-(void)onClickDone{
    T4_LOG_FUNC();
    [self.view endEditing:YES];
    NSString *oldPassword = [UserManager sharedInstance].password;
    NSString *inputPassword = _oldPswTextField.text;
    NSString *password = _pswTextField.text;
    NSString *confirmPassword = _confirmPswTextField.text;
    if ([inputPassword compare:oldPassword] != NSOrderedSame) {
        [self.view makeToast:@"输入原密码不正确!"];
        return;
    }
    if (password.length < 6) {
        [self.view makeToast:@"密码至少六位"];
        return;
    }
    if ([confirmPassword compare:password] != NSOrderedSame) {
        [self.view makeToast:@"两次输入密码不一致!"];
        return;
    }
    [self.view makeToastActivity];
    RequestChangePassword *requestChangePassword = [[RequestChangePassword alloc]init];
    requestChangePassword.mobile = [UserManager sharedInstance].mobile;
    requestChangePassword.password = password;
    [[BusinessManager sharedInstance] post:requestChangePassword success:^(RequestBean *request, ResponseBean *response) {
        [[UserManager sharedInstance] setPassword:password];
        [self.view hideToastActivity];
        [self.view makeToast:@"修改成功!"];
        [self back];
        
    } failure:^(RequestBean *request, NSInteger errorCode, NSString *message) {
        T4_LOG_INFO(@"errorCode:%ld, message:%@", errorCode, message);
        [self.view hideToastActivity];
        [self.view makeToast:[NSString stringWithFormat:@"%@",message]];
        
    }];

}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [super touchesBegan:touches withEvent:event];
    [_oldPswTextField resignFirstResponder];
    [_pswTextField resignFirstResponder];
    [_confirmPswTextField resignFirstResponder];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

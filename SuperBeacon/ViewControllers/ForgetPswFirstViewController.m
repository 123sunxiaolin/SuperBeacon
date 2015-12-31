//
//  ForgetPswFirstViewController.m
//  SuperBeacon
//
//  Created by kys－1 on 15-5-1.
//  Copyright (c) 2015年 孙晓林. All rights reserved.
//

#import "ForgetPswFirstViewController.h"
#import "UIView+Utils.h"
#import "UIButton+Utils.h"
#import "T4Bundle.h"
#import "NINetworkImageView.h"
#import "GetVerifyCodePresenter.h"
#import "NSString+Utils.h"
#import "UIView+Toast.h"

@interface ForgetPswFirstViewController ()<GetVerifyCodePresenterDelegate>
@property (weak, nonatomic) IBOutlet NINetworkImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UIView *phoneBackgroundView;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UIView *codeBackgroundView;
@property (weak, nonatomic) IBOutlet UIButton *getCodeBtn;
@property (weak, nonatomic) IBOutlet UITextField *codeTextField;
@property (weak, nonatomic) IBOutlet UIButton *nextBtn;
@property (nonatomic, strong)GetVerifyCodePresenter *getVerifyCodePresenter;
@end

@implementation ForgetPswFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"忘记密码";
    [self setLeftNavButtonType:NavButtonBack];
    
    [_phoneBackgroundView setCornerRadius:2 borderColor:HEXCOLOR(0xD7D7D7)];
    [_codeBackgroundView setCornerRadius:2 borderColor:HEXCOLOR(0xD7D7D7)];
    _phoneBackgroundView.alpha = 0.8;
    _codeBackgroundView.alpha = 0.8;
    [_getCodeBtn addTarget:self action:@selector(onClickGetConfirmCode:)];
    [_nextBtn addTarget:self action:@selector(onClickNextBtn:)];
    
    _getVerifyCodePresenter = [[GetVerifyCodePresenter alloc]init];
    _getVerifyCodePresenter.delegate = self;
    _getVerifyCodePresenter.button = _getCodeBtn;
}

- (void)onClickGetConfirmCode:(UIButton *)sender{
    T4_LOG_FUNC();
    NSString *mobile = _phoneTextField.text;
    if (![mobile validatePhone]) {
        [self.view makeToast:@"手机号码格式不正确"];
    }else{
        [_getVerifyCodePresenter requestVerifyCodeWithMobile:mobile];
    }
}


- (void)onClickNextBtn:(UIButton *)btn{
    T4_LOG_FUNC();
    NSString *mobile = _phoneTextField.text;
    NSString *code = _codeTextField.text;
    if (![mobile validatePhone]) {
        [self.view makeToast:@"手机号码格式不正确"];
    }else if(code.length <= 1){
        [self.view makeToast:@"验证码不能为空"];
    }else{
    [self.view makeToastActivity];
    [_getVerifyCodePresenter commitVerifyCode:code];
    }
    
}

#pragma mark ------GetVerifyCodePresenterDelegate
- (void)onVerifyCompleteStatus:(BOOL)success{
    NSString *mobile = _phoneTextField.text;
    [self.view hideToastActivity];
    if (success) {
        T4Bundle *bundle = [T4Bundle createBundle];
        [bundle putObject:mobile forKey:@"mobile"];
        [self showWithClassName:@"ForgetPswSecondViewController" bundle:bundle];
    }else{
        [self.view makeToast:@"验证失败,请重新获取验证码"];
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [super touchesBegan:touches withEvent:event];
    [_phoneTextField resignFirstResponder];
    [_codeTextField resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

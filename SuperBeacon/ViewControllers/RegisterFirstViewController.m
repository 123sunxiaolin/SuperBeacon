//
//  RegisterFirstViewController.m
//  SuperBeacon
//
//  Created by kys－1 on 15-5-1.
//  Copyright (c) 2015年 孙晓林. All rights reserved.
//

#import "RegisterFirstViewController.h"
#import "NINetworkImageView.h"
#import "TTTAttributedLabel.h"
#import "UIView+Utils.h"
#import "GetVerifyCodePresenter.h"
#import "NSString+Utils.h"
#import "UIView+Toast.h"

@interface RegisterFirstViewController ()<UITextFieldDelegate, TTTAttributedLabelDelegate, GetVerifyCodePresenterDelegate>

@property (weak, nonatomic) IBOutlet NINetworkImageView *backgroundImageView;

@property (weak, nonatomic) IBOutlet UIView *phoneBackView;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;

@property (weak, nonatomic) IBOutlet UIView *pswBackView;
@property (weak, nonatomic) IBOutlet UITextField *pswTextField;

@property (weak, nonatomic) IBOutlet UIView *confirmPswBackView;
@property (weak, nonatomic) IBOutlet UITextField *confirmPswTextField;

@property (weak, nonatomic) IBOutlet UIView *codeBackView;
@property (weak, nonatomic) IBOutlet UITextField *codeTextField;
@property (weak, nonatomic) IBOutlet UIButton *getCodeBtn;

@property (weak, nonatomic) IBOutlet UIView *recommendBackView;
@property (weak, nonatomic) IBOutlet UITextField *recommendTextField;

@property (weak, nonatomic) IBOutlet TTTAttributedLabel *agreementLabel;
@property (weak, nonatomic) IBOutlet UIButton *nextBtn;

@property (nonatomic, strong)GetVerifyCodePresenter *getVerifyCodePresenter;
@end

@implementation RegisterFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"注册";
    [self setLeftNavButtonType:NavButtonBack];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    [_phoneBackView setCornerRadius:2 borderColor:HEXCOLOR(0xD7D7D7)];
    _phoneBackView.alpha = 0.8;
    [_pswBackView setCornerRadius:2 borderColor:HEXCOLOR(0xD7D7D7)];
    _pswBackView.alpha = 0.8;
    [_confirmPswBackView setCornerRadius:2 borderColor:HEXCOLOR(0xD7D7D7)];
    _confirmPswBackView.alpha = 0.8;
    [_codeBackView setCornerRadius:2 borderColor:HEXCOLOR(0xD7D7D7)];
    _codeBackView.alpha = 0.8;
    [_recommendBackView setCornerRadius:2 borderColor:HEXCOLOR(0xD7D7D7)];
    _recommendBackView.alpha = 0.8;
    
    _phoneTextField.clearButtonMode = UITextFieldViewModeAlways;
    _phoneTextField.delegate = self;

    _pswTextField.clearButtonMode = UITextFieldViewModeAlways;
    _pswTextField.delegate = self;

    _confirmPswTextField.clearButtonMode = UITextFieldViewModeAlways;
    _confirmPswTextField.delegate = self;

    _codeTextField.clearButtonMode = UITextFieldViewModeAlways;
    _codeTextField.delegate = self;

    _recommendTextField.clearButtonMode = UITextFieldViewModeAlways;
    _recommendTextField.delegate = self;
    
    _agreementLabel.enabledTextCheckingTypes = NSTextCheckingTypeAddress;
    _agreementLabel.delegate = self;
    [_agreementLabel setText:@"用户协议" afterInheritingLabelAttributesAndConfiguringWithBlock:^NSMutableAttributedString *(NSMutableAttributedString *mutableAttributedString) {
        NSRange range = [[NSMutableString string]rangeOfString:@"用户协议"];
        [mutableAttributedString addAttribute:(NSString*)kCTForegroundColorAttributeName value:(id)[HEXCOLOR(0x157EFB) CGColor] range:range];
        return mutableAttributedString;
    }];
    [_agreementLabel addLinkToURL:nil withRange:NSMakeRange(0, 4)];
    [_nextBtn addTarget:self action:@selector(onClickNextBtn:)];
    [_getCodeBtn addTarget:self action:@selector(onClickGetConfirmCode:)];
    
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

- (void)onClickNextBtn:(UIButton *)sender{
    T4_LOG_FUNC();
    NSString *mobile = _phoneTextField.text;
    NSString *password = _pswTextField.text;
    NSString *confirmPassword = _confirmPswTextField.text;
    NSString *verifyCode = _codeTextField.text;
    NSString *recommend = _recommendTextField.text;
    if (![mobile validatePhone]) {
        [self.view makeToast:@"手机号码格式不正确"];
        return;
    }
    if (password.length < 6) {
        [self.view makeToast:@"密码至少为6位"];
        return;
    }
    if (verifyCode.length <= 0) { 
        [self.view makeToast:@"校验码不能为空"];
        return;
    }
    if ([password compare:confirmPassword] != NSOrderedSame) {
        [self.view makeToast:@"两次输入密码不一致"];
        return;
    }
    T4Bundle *bundle = [[T4Bundle alloc] init];
    [bundle putObject:mobile forKey:@"Mobile"];
    [bundle putObject:password forKey:@"Password"];
    [bundle putObject:recommend forKey:@"Recommender"];
    [self showWithClassName:@"RegisterSecondViewController" bundle:bundle];
}

#pragma mark ---------UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if (IS_IPHONE4 && (textField == _codeTextField || textField == _recommendTextField)) {
        NSTimeInterval animationDuration=0.30f;
        [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
        [UIView setAnimationDuration:animationDuration];
        
        CGFloat width = self.view.frame.size.width;
        CGFloat height = self.view.frame.size.height;
        
        CGFloat y = - 100;
        CGRect rect = CGRectMake(0.0f, y, width, height);
        self.view.frame = rect;
        
        [UIView commitAnimations];
    }
    
    
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    return NO;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [super touchesBegan:touches withEvent:event];
    [_phoneTextField resignFirstResponder];
    [_pswTextField resignFirstResponder];
    [_confirmPswTextField resignFirstResponder];
    [_codeTextField resignFirstResponder];
    [_recommendTextField resignFirstResponder];
    
    if (IS_IPHONE4) {
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
}

#pragma mark - TTTAttributedLabelDelegate
- (void)attributedLabel:(TTTAttributedLabel *)label didSelectLinkWithURL:(NSURL *)url
{
    T4_LOG_FUNC();
    [self showWithClassName:@"AgreeMentViewController"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

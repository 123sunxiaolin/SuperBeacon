//
//  RegisterSecondViewController.m
//  SuperBeacon
//
//  Created by kys－1 on 15-5-1.
//  Copyright (c) 2015年 孙晓林. All rights reserved.
//

#import "RegisterSecondViewController.h"
#import "NINetworkImageView.h"
#import "ChoosePhotoPresenter.h"
#import "ChooseAddressPresenter.h"
#import "UIView+Toast.h"
#import "RequestRegister.h"
#import "ResponseRegister.h"
#import "BusinessManager.h"
#import "RequestChangeAvatar.h"
#import "ResponseChangeAvatar.h"
#import "UserManager.h"
#import "PKRevealController.h"
#import "MarketViewController.h"

@interface RegisterSecondViewController ()<UITextFieldDelegate, ChoosePhotoDelegate, ChooseAddressDelegate>{
    ChoosePhotoPresenter *_choosePhotoPresenter;
    ChooseAddressPresenter *_chooseAddressPresenter;
    UIImage *_avatar;
}
@property (weak, nonatomic) IBOutlet NINetworkImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UIButton *avatarBtn;
@property (weak, nonatomic) IBOutlet UIView *nickNameBackView;
@property (weak, nonatomic) IBOutlet UITextField *nickNameTextField;
@property (weak, nonatomic) IBOutlet UIView *addressBackView;
@property (weak, nonatomic) IBOutlet UITextField *addressTextField;
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;

@end

@implementation RegisterSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"注册";
    [self setLeftNavButtonType:NavButtonBack];
    _avatar = [UIImage imageNamed:@"icon_person_default"];//init
    
    _choosePhotoPresenter = [[ChoosePhotoPresenter alloc] init];
    _choosePhotoPresenter.viewController = self;
    _choosePhotoPresenter.delegate = self;
    _choosePhotoPresenter.needCrop = YES;
    
    _chooseAddressPresenter = [[ChooseAddressPresenter alloc] init];
    _chooseAddressPresenter.viewController = self;
    _chooseAddressPresenter.delegate = self;
    
    [_avatarImageView.layer setCornerRadius:CGRectGetWidth(_avatarImageView.frame) / 2];
    _avatarImageView.clipsToBounds = YES;
    [_avatarBtn.layer setCornerRadius:CGRectGetWidth(_avatarBtn.frame)];
    _avatarBtn.clipsToBounds = YES;
    [_avatarBtn addTarget:self action:@selector(onClickAvatarBtn:)];
    
    [_nickNameBackView setCornerRadius:2 borderColor:HEXCOLOR(0xD7D7D7)];
    _nickNameBackView.alpha = 0.8;
    [_addressBackView setCornerRadius:2 borderColor:HEXCOLOR(0xD7D7D7)];
    _addressBackView.alpha = 0.8;
    
    _nickNameTextField.clearButtonMode = UITextFieldViewModeAlways;
    _nickNameTextField.delegate = self;
    _addressTextField.clearButtonMode = UITextFieldViewModeAlways;
    _addressTextField.delegate = self;
    
    [_registerBtn addTarget:self action:@selector(onClickRegisterBtn:)];
}

- (void)onClickAvatarBtn:(UIButton *)sender{
    T4_LOG_FUNC();
    [self.view endEditing:YES];
    [_choosePhotoPresenter showOptions];
}

- (void)onClickRegisterBtn:(UIButton *)sender{
    T4_LOG_FUNC();
    [self.view endEditing:YES];
    NSString *mobile = [self.bundle objectForKey:@"Mobile"];
    NSString *password = [self.bundle objectForKey:@"Password"];
    NSString *recommender = [self.bundle objectForKey:@"Recommender"];
    NSString *nickName = _nickNameTextField.text;
    NSString *address = _addressTextField.text;
    if (nickName.length <= 0) {
        [self.view makeToast:@"请填写昵称"];
        return;
    }
    if (address.length <= 0) {
        [self.view makeToast:@"请选择相应地址"];
        return;
    }
    [self.view makeToastActivity];
    RequestRegister *requestRegister = [[RequestRegister alloc]init];
    requestRegister.mobile = mobile;
    requestRegister.password = password;
    requestRegister.recommender = recommender;
    requestRegister.nick = nickName;
    requestRegister.address = address;
    [[BusinessManager sharedInstance] post:requestRegister success:^(RequestBean *request, ResponseBean *response){
        [[UserManager sharedInstance] setUserResponse:(ResponseUser *)response];
//        NSParameterAssert(T4_CHECK_CLASS(response, ResponseUser));
//        ResponseUser *responseUser = (ResponseUser *)response;
//        NSLog(@"address = %@",responseUser.address);
        if (_avatar) {
            [self requestChangeAvatarWithMobile:mobile];
        }
    }failure:^(RequestBean *request, NSInteger errorCode, NSString *message){
        [self.view hideToastActivity];
        [self.view makeToast:[NSString stringWithFormat:@"注册失败！%@", message]];
    }];
    
}

- (void)requestChangeAvatarWithMobile:(NSString *)mobile
{
    RequestChangeAvatar *request = [[RequestChangeAvatar alloc] init];
    [request setAvatar:_avatar];
    request.mobile = mobile;
    [[BusinessManager sharedInstance] mutiplePost:request success:^(RequestBean *request, ResponseBean *response) {
        ResponseChangeAvatar *responseChangeAvatar = (ResponseChangeAvatar*) response;
        [UserManager sharedInstance].avatarUrl = responseChangeAvatar.avatar_url;
        [self.view hideToastActivity];
        [self.view makeToast:@"登录成功!"];
        //跳转
        MarketViewController *marketViewController = [[MarketViewController alloc]init];
        UINavigationController *front = [[UINavigationController alloc]initWithRootViewController:marketViewController];
        [self.revealController setFrontViewController:front];
        [self.revealController showViewController:self.revealController.frontViewController animated:YES completion:nil];
    } failure:^(RequestBean *request, NSInteger errorCode, NSString *message) {
        [self.view hideToastActivity];
        [self.view makeToast:[NSString stringWithFormat:@"错误->%@", message]];
    }];
}
#pragma mark ---------UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if (textField == _addressTextField) {
        [textField resignFirstResponder];
        [_nickNameTextField resignFirstResponder];
        [_chooseAddressPresenter loadView];
        return NO;
    }
    if (IS_IPHONE4) {
        NSTimeInterval animationDuration=0.30f;
        [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
        [UIView setAnimationDuration:animationDuration];
        
        CGFloat width = self.view.frame.size.width;
        CGFloat height = self.view.frame.size.height;
        
        CGFloat y = - 50;
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
    [_addressTextField resignFirstResponder];
    [_nickNameTextField resignFirstResponder];
    
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

#pragma mark - ChoosePhotoDelegate

- (void)choosePhotoDidFinished:(UIImage *)editedImage{
    if (editedImage) {
        _avatar = editedImage;
        _avatarImageView.image = editedImage;
    }
}

#pragma mark - ChooseAddressDelegate
- (void)onClickAddressChoosed:(NSString *)address{
    if (address) {
        _addressTextField.text = address;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

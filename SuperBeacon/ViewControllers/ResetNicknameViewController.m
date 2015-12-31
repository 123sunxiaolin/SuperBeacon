//
//  ResetNicknameViewController.m
//  SuperBeacon
//
//  Created by kys－1 on 15-5-2.
//  Copyright (c) 2015年 孙晓林. All rights reserved.
//

#import "ResetNicknameViewController.h"
#import "UserManager.h"
#import "BusinessManager.h"
#import "RequestChangeNick.h"
#import "UIView+Toast.h"

@interface ResetNicknameViewController ()
@property (weak, nonatomic) IBOutlet UIView *nickNameBackView;
@property (weak, nonatomic) IBOutlet UITextField *nickNameTextField;

@end

@implementation ResetNicknameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"修改昵称";
    [self setLeftNavButtonType:NavButtonBack];
    [self setRightNavButtonType:NavButtonDone];
    self.view.backgroundColor = HEXCOLOR(0xFAFAFA);
    
    [_nickNameBackView setCornerRadius:0 borderColor:HEXCOLOR(0xD7D7D7) borderWidth:0.5];
    _nickNameTextField.clearButtonMode = UITextFieldViewModeAlways;
    _nickNameTextField.text = [UserManager sharedInstance].nickName;
    [_nickNameTextField becomeFirstResponder];
}

-(void)onClickDone{
    T4_LOG_FUNC();
    [_nickNameTextField resignFirstResponder];
    NSString *nick = _nickNameTextField.text;
    NSString *oldlNick = [UserManager sharedInstance].nickName;
    if ([nick compare:oldlNick] == NSOrderedSame) {
        [self.view makeToast:@"昵称已存在！"];
        return;
    }
    if ([_nickNameTextField.text compare:@""] == NSOrderedSame) {
        [self.view makeToast:@"昵称不能为空！"];
        return;
    }
    [self.view makeToastActivity];
    RequestChangeNick *requestChangeNick = [[RequestChangeNick alloc]init];
    requestChangeNick.mobile = [UserManager sharedInstance].mobile;
    requestChangeNick.nick = nick;
    [[BusinessManager sharedInstance] post:requestChangeNick success:^(RequestBean *request, ResponseBean *response) {
        [[UserManager sharedInstance] setNickName:nick];
        [self.view hideToastActivity];
        [self back];
        
    } failure:^(RequestBean *request, NSInteger errorCode, NSString *message) {
        T4_LOG_INFO(@"errorCode:%ld, message:%@", errorCode, message);
        [self.view hideToastActivity];
        [self.view makeToast:[NSString stringWithFormat:@"%@",message]];
        
    }];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [super touchesBegan:touches withEvent:event];
    [_nickNameTextField resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

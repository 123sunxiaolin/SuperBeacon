//
//  GetVerifyCodePresenter.m
//  SuperBeacon
//
//  Created by kys－1 on 15-5-4.
//  Copyright (c) 2015年 孙晓林. All rights reserved.
//

#import "GetVerifyCodePresenter.h"
#import "UIButton+Utils.h"
#import "UIView+Toast.h"
#import "T4Marco.h"
#import <SMS_SDK/SMS_SDK.h>

#define kZoneCode @"86"
@interface GetVerifyCodePresenter ()
{
    NSTimer *_timer;
    NSInteger _second;
}
@property(nonatomic, strong)NSString *mobile;
@end
@implementation GetVerifyCodePresenter
- (id)init
{
    self = [super init];
    if (self) {
        _second = 60;
        _timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                  target:self
                                                selector:@selector(onTime:)
                                                userInfo:nil
                                                 repeats:YES];
        [_timer setFireDate:[NSDate distantFuture]];//close
    }
    
    return self;
}

- (void)onTime:(id)n
{
    if (_second-- == 0) {
        self.button.enabled = YES;
        [self.button setTitle:@"获取验证码"];
        [_timer setFireDate:[NSDate distantFuture]];
    } else {
        self.button.enabled = NO;
        [self.button setTitle:[NSString stringWithFormat:@"剩%ld秒", _second]];
    }
}

- (void)requestVerifyCodeWithMobile:(NSString *)mobile{
    
    [_timer setFireDate:[NSDate distantPast]];//start
    [SMS_SDK getVerificationCodeBySMSWithPhone:mobile
                                          zone:kZoneCode
                                        result:^(SMS_SDKError *error){
                                            if (error) {
                                                T4_LOG_INFO(@"获取验证码错误%@",error);
                                            }
                                            _mobile = mobile;
                                        
                                        }];

}

- (void)commitVerifyCode:(NSString *)code{
    [SMS_SDK commitVerifyCode:code result:^(enum SMS_ResponseState state) {
        if (1 == state) {
            [_delegate onVerifyCompleteStatus:YES];
        }else{
            [_delegate onVerifyCompleteStatus:NO];
        }
    }];
}

@end

//
//  GetVerifyCodePresenter.h
//  SuperBeacon
//
//  Created by kys－1 on 15-5-4.
//  Copyright (c) 2015年 孙晓林. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol GetVerifyCodePresenterDelegate <NSObject>

- (void)onVerifyCompleteStatus:(BOOL)success;

@end

@interface GetVerifyCodePresenter : NSObject

@property(nonatomic, weak) id <GetVerifyCodePresenterDelegate> delegate;
@property (nonatomic, weak) UIButton *button;
- (void)requestVerifyCodeWithMobile:(NSString *)mobile;
- (void)commitVerifyCode:(NSString *)code;
@end

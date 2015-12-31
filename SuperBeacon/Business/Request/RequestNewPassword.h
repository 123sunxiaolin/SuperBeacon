//
//  RequestNewPassword.h
//  EarthIOS
//
//  Created by 徐淮杰 on 15/3/21.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import "RequestBean.h"

@interface RequestNewPassword : RequestBean

@property (nonatomic, strong) NSString *mobile; //手机号
@property (nonatomic, strong) NSString *password; //新设置的密码
@property (nonatomic, strong) NSString *varify_code;

@end

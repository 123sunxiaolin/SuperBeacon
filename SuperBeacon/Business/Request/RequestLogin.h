//
//  RequestLogin.h
//  EarthIOS
//
//  Created by kys-2 on 15-3-21.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import "RequestBean.h"

@interface RequestLogin : RequestBean

@property (nonatomic, strong) NSString * mobile; //手机号
@property (nonatomic, strong) NSString * password; //密码

@end

//
//  RequestThirdLogin.h
//  EarthIOS
//
//  Created by Xiaohui on 15/4/16.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import "RequestBean.h"

typedef enum {
    QQ = 1,
    WeiXin,
} Source;

@interface RequestThirdLogin : RequestBean

@property (nonatomic) NSInteger source;
@property (nonatomic, strong) NSString *openId;
@property (nonatomic, strong) NSString *nick;
@property (nonatomic, strong) NSString *avatar_url;
@property (nonatomic, strong) NSString *sex;
@property (nonatomic, strong) NSString *birthday;

@end

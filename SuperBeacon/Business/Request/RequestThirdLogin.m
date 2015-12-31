//
//  RequestThirdLogin.m
//  EarthIOS
//
//  Created by Xiaohui on 15/4/16.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import "RequestThirdLogin.h"
#import "ResponseLogin.h"
#import "Path.h"

@implementation RequestThirdLogin
- (Class)responseClass
{
    return [ResponseLogin class];
}

- (NSString *)path
{
    return UserThirdLogin;
}

- (BOOL)needToken
{
    return NO;
}
@end

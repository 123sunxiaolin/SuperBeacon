//
//  RequestLogin.m
//  EarthIOS
//
//  Created by kys-2 on 15-3-21.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import "RequestLogin.h"
#import "ResponseLogin.h"
#import "Path.h"

@implementation RequestLogin

- (Class)responseClass
{
    return [ResponseLogin class];
}

- (NSString *)path
{
    return UserLogin;
}

- (BOOL)needToken
{
    return NO;
}

@end

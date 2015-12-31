//
//  RequestNewPassword.m
//  EarthIOS
//
//  Created by 徐淮杰 on 15/3/21.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import "RequestNewPassword.h"
#import "Path.h"
#import "ResponseNewPassword.h"

@implementation RequestNewPassword

- (Class)responseClass
{
    return [ResponseNewPassword class];
}

- (NSString *)path
{
    return NewPassword;
}

- (BOOL)needToken
{
    return YES;
}


@end

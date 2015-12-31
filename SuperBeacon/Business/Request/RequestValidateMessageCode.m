//
//  RequestValidateMessageCode.m
//  EarthIOS
//
//  Created by 徐淮杰 on 15/3/21.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import "RequestValidateMessageCode.h"
#import "ResponseValidateMessageCode.h"
#import "Path.h"

@implementation RequestValidateMessageCode

- (Class)responseClass
{
    return [ResponseValidateMessageCode class];
}

- (NSString *)path
{
    return ValidateMessageCode;
}

- (BOOL)needToken
{
    return NO;
}

@end

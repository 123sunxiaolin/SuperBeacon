//
//  RequestRegister.m
//  EarthIOS
//
//  Created by 徐淮杰 on 15/3/21.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import "RequestRegister.h"
#import "Path.h"
#import "ResponseRegister.h"

@implementation RequestRegister

//MTL_DATE_TRANSFORMER(birthday, @"yyyy-MM-dd")

- (Class)responseClass
{
    return [ResponseRegister class];
}

- (NSString *)path
{
    return UserRegister;
}

- (BOOL)needToken
{
    return NO;
}


@end

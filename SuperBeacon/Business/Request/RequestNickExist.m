//
//  RequestNickExist.m
//  EarthIOS
//
//  Created by 徐淮杰 on 15/3/21.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import "RequestNickExist.h"
#import "ResponseNickExist.h"
#import "Path.h"

@implementation RequestNickExist

- (Class)responseClass
{
    return [ResponseNickExist class];
}

- (NSString *)path
{
    return NickExist;
}

- (BOOL)needToken
{
    return NO;
}


@end

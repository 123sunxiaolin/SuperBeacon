//
//  RequestActionDetail.m
//  EarthIOS
//
//  Created by kys-2 on 15-3-21.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import "RequestActionDetail.h"
#import "ResponseActionDetail.h"
#import "Path.h"

@implementation RequestActionDetail
- (Class)responseClass
{
    return [ResponseActionDetail class];
}

- (NSString *)path
{
    return ActionDetail;
}

- (BOOL)needToken
{
    return YES;
}

@end

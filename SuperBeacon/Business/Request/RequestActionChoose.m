//
//  RequestActionChoose.m
//  EarthIOS
//
//  Created by kys-2 on 15-3-21.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import "RequestActionChoose.h"
#import "ResponseActionChoose.h"
#import "Path.h"

@implementation RequestActionChoose
- (Class)responseClass
{
    return [ResponseActionChoose class];
}

- (NSString *)path
{
    return ActionChoose;
}
- (BOOL)needToken
{
    return YES;
}

@end

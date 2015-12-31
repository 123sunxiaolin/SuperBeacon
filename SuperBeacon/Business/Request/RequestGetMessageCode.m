//
//  RequestGetMessageCode.m
//  EarthIOS
//
//  Created by kys-2 on 15-3-21.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import "RequestGetMessageCode.h"
#import "ResponseGetMessageCode.h"
#import "Path.h"
@implementation RequestGetMessageCode
- (Class)responseClass
{
    return [ResponseGetMessageCode class];
}

- (NSString *)path
{
    return GetMessageCode;
}

- (BOOL)needToken
{
    return YES;
}

@end

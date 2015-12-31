//
//  RequestAppVersion.m
//  EarthIOS
//
//  Created by kys-2 on 15-3-22.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import "RequestAppVersion.h"
#import "ResponseAppVersion.h"
#import "Path.h"
@implementation RequestAppVersion
- (Class)responseClass
{
    return [ResponseAppVersion class];
}

- (NSString *)path
{
    return AppVersion;
}

- (BOOL)needToken
{
    return NO;
}
@end

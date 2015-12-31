//
//  RequestActionJoined.m
//  EarthIOS
//
//  Created by kys-2 on 15-3-21.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import "RequestActionJoined.h"
#import "ResponseActionJoined.h"
#import "Path.h"

@implementation RequestActionJoined
- (Class)responseClass
{
    return [ResponseActionJoined class];
}

- (NSString *)path
{
    return ActionJoined;
}

- (BOOL)needToken
{
    return YES;
}

@end

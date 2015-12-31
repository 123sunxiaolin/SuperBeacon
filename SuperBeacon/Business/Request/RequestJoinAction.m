//
//  RequestJoinAction.m
//  EarthIOS
//
//  Created by kys-2 on 15-3-21.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import "RequestJoinAction.h"
#import "ResponseJoinAction.h"
#import "Path.h"

@implementation RequestJoinAction

- (Class)responseClass
{
    return [ResponseJoinAction class];
}

- (NSString *)path
{
    return JoinAction;
}

- (BOOL)needToken
{
    return YES;
}
@end

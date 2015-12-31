//
//  RequestCreateAction.m
//  EarthIOS
//
//  Created by kys-2 on 15-3-21.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import "RequestCreateAction.h"
#import "ResponseCreateAction.h"
#import "Path.h"

@implementation RequestCreateAction
- (Class)responseClass
{
    return [ResponseCreateAction class];
}

- (NSString *)path
{
    return CreateAction;
}

- (BOOL)needToken
{
    return YES;
}

@end

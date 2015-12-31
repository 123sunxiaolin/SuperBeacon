//
//  RequestSendPresent.m
//  EarthIOS
//
//  Created by kys-2 on 15-3-21.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import "RequestSendPresent.h"
#import "ResponseSendPresent.h"
#import "Path.h"
@implementation RequestSendPresent

- (Class)responseClass
{
    return [ResponseSendPresent class];
}

- (NSString *)path
{
    return SendPresent;
}

- (BOOL)needToken
{
    return YES;
}
@end

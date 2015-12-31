//
//  RequestActionKind.m
//  EarthIOS
//
//  Created by Darren Yau on 19/4/15.
//  Copyright (c) 2015 Duno Tech. All rights reserved.
//

#import "RequestActionKind.h"
#import "ResponseActionKind.h"
#import "path.h"

@implementation RequestActionKind

- (Class)responseClass
{
    return [ResponseActionKind class];
}

- (NSString *)path
{
    return ActionKinds;
}

@end

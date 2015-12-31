//
//  RequestFollow.m
//  EarthIOS
//
//  Created by kys-2 on 15-3-21.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import "RequestFollow.h"
#import "ResponseFollow.h"
#import "Path.h"
@implementation RequestFollow

- (Class)responseClass
{
    return [ResponseFollow class];
}

- (NSString *)path
{
    return Follow;
}
@end

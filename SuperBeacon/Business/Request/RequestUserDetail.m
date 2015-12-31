//
//  RequestUserDetail.m
//  EarthIOS
//
//  Created by kys-2 on 15-3-21.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import "RequestUserDetail.h"
#import "ResponseUserDetail.h"
#import "Path.h"

@implementation RequestUserDetail
- (Class)responseClass
{
    return [ResponseUserDetail class];
}

- (NSString *)path
{
    return UserDetail;
}
@end

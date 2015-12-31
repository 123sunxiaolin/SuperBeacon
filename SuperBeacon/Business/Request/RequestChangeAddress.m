//
//  RequestChangeAddress.m
//  SuperBeacon
//
//  Created by kys－1 on 15-5-7.
//  Copyright (c) 2015年 孙晓林. All rights reserved.
//

#import "RequestChangeAddress.h"
#import "ResponseBean.h"
#import "Path.h"

@implementation RequestChangeAddress
- (Class)responseClass
{
    return [ResponseBean class];
}

- (NSString *)path
{
    return UpdateInfo;
}

@end

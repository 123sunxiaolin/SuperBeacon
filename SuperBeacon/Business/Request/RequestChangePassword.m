//
//  RequestChangePassword.m
//  SuperBeacon
//
//  Created by kys－1 on 15-5-7.
//  Copyright (c) 2015年 孙晓林. All rights reserved.
//

#import "RequestChangePassword.h"
#import "ResponseBean.h"
#import "Path.h"

@implementation RequestChangePassword
- (Class)responseClass
{
    return [ResponseBean class];
}

- (NSString *)path
{
    return UpdateInfo;
}
@end

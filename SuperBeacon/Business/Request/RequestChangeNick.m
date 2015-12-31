//
//  RequestChangeNick.m
//  EarthIOS
//
//  Created by kys－1 on 15-4-19.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import "RequestChangeNick.h"
#import "ResponseBean.h"
#import "Path.h"

@implementation RequestChangeNick
- (Class)responseClass
{
    return [ResponseBean class];
}

- (NSString *)path
{
    return UpdateInfo;
}
@end

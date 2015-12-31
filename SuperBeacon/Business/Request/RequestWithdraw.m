//
//  RequestWithdraw.m
//  EarthIOS
//
//  Created by kys-2 on 15-3-21.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import "RequestWithdraw.h"
#import "ResponseWithdraw.h"
#import "Path.h"
@implementation RequestWithdraw

- (Class)responseClass
{
    return [ResponseWithdraw class];
}

- (NSString *)path
{
    return Withdraw;
}
@end

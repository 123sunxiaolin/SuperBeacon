//
//  RequestWithdrawPriceList.m
//  EarthIOS
//
//  Created by kys-2 on 15-3-21.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import "RequestWithdrawPriceList.h"
#import "ResponseWithdrawPriceList.h"
#import "Path.h"
@implementation RequestWithdrawPriceList

- (Class)responseClass
{
    return [ResponseWithdrawPriceList class];
}

- (NSString *)path
{
    return WithdrawPriceList;
}
@end

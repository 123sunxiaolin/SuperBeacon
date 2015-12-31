//
//  RequestWithdrawRecord.m
//  EarthIOS
//
//  Created by kys－1 on 15-4-16.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import "RequestWithdrawRecord.h"
#import "ResponseGoodsRecord.h"
#import "Path.h"

@implementation RequestWithdrawRecord
- (Class)responseClass
{
    return [ResponseGoodsRecord class];
}

- (NSString *)path
{
    return WithdrawRecord;
}
@end

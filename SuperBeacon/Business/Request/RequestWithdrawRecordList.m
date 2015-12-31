//
//  RequestWithdrawRecordList.m
//  EarthIOS
//
//  Created by kys-2 on 15-3-21.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import "RequestWithdrawRecordList.h"
#import "ResponseWithdrawRecordList.h"
#import "Path.h"

@implementation RequestWithdrawRecordList

- (Class)responseClass
{
    return [ResponseWithdrawRecordList class];
}

- (NSString *)path
{
    return WithdrawRecordList;
}
@end

//
//  RequestBuyMember.m
//  EarthIOS
//
//  Created by kys-2 on 15-3-21.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import "RequestBuyMember.h"
#import "ResponseBuyMember.h"
#import "Path.h"

@implementation RequestBuyMember
- (Class)responseClass
{
    return [ResponseBuyMember class];
}

- (NSString *)path
{
    return BuyMember;
}
@end

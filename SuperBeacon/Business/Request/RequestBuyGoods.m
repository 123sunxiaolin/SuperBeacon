//
//  RequestBuyGoods.m
//  EarthIOS
//
//  Created by kys-2 on 15-3-21.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import "RequestBuyGoods.h"
#import "ResponseBuyGoods.h"
#import "Path.h"

@implementation RequestBuyGoods
- (Class)responseClass
{
    return [ResponseBuyGoods class];
}

- (NSString *)path
{
    return BuyGoods;
}

@end

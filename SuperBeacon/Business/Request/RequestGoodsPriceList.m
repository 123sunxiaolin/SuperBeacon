//
//  RequestGoodsPriceList.m
//  EarthIOS
//
//  Created by kys-2 on 15-3-21.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import "RequestGoodsPriceList.h"
#import "ResponseGoodsPriceList.h"
#import "Path.h"

@implementation RequestGoodsPriceList

- (Class)responseClass
{
    return [ResponseGoodsPriceList class];
}

- (NSString *)path
{
    return GetGoodsPriceList;
}
@end

//
//  RequestWealth.m
//  EarthIOS
//
//  Created by kys-2 on 15-3-21.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import "RequestWealth.h"
#import "ResponseWealth.h"
#import "Path.h"
@implementation RequestWealth

- (Class)responseClass
{
    return [ResponseWealth class];
}

- (NSString *)path
{
    return Wealth;
}

@end

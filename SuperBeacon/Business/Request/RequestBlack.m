//
//  RequestBlack.m
//  EarthIOS
//
//  Created by kys-2 on 15-3-21.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import "RequestBlack.h"
#import "ResponseBlack.h"
#import "Path.h"

@implementation RequestBlack

- (Class)responseClass
{
    return [ResponseBlack class];
}

- (NSString *)path
{
    return Black;
}

@end

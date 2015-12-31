//
//  RequestActionAll.m
//  EarthIOS
//
//  Created by Xiaohui on 15/3/20.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import "RequestActionAll.h"
#import "ResponseActionAll.h"
#import "Path.h"

@implementation RequestActionAll

- (id)init
{
    self = [super init];
    if (self) {
        self.page_num = 1;
        self.count_perpage = 200;
    }
    return self;
}

- (Class)responseClass
{
    return [ResponseActionAll class];
}

- (NSString *)path
{
    return ActionAll;
}

@end

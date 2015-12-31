//
//  RequestRank.m
//  EarthIOS
//
//  Created by kys-2 on 15-3-21.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import "RequestRank.h"
#import "ResponseRank.h"
#import "Path.h"

@implementation RequestRank
- (id)init
{
    self = [super init];
    if (self) {
        self.page_num = 1;
        self.count_perpage = 100;
    }
    return self;
}

- (Class)responseClass
{
    return [ResponseRank class];
}

- (NSString *)path
{
    return Rank;
}
@end

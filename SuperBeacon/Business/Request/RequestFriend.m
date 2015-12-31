//
//  RequestFriend.m
//  EarthIOS
//
//  Created by kys-2 on 15-3-21.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import "RequestFriend.h"
#import "ResponseFriend.h"
#import "Path.h"

 static NSString *Following = @"mynotice";
 static NSString *Follower = @"noticeme";
 static NSString *BlackStr = @"blackname";

@implementation RequestFriend

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
    return [ResponseFriend class];
}

- (NSString *)path
{
    return Friend;
}
@end

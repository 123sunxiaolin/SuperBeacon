//
//  RequestAlbum.m
//  EarthIOS
//
//  Created by kys-2 on 15-3-21.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import "RequestAlbum.h"
#import "ResponseAlbum.h"
#import "Path.h"

@implementation RequestAlbum
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
    return [ResponseAlbum class];
}

- (NSString *)path
{
    return Album;
}
@end

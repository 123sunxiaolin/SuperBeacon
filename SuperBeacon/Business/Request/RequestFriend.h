//
//  RequestFriend.h
//  EarthIOS
//
//  Created by kys-2 on 15-3-21.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import "RequestBean.h"

@interface RequestFriend : RequestBean

@property (nonatomic, strong) NSString *kind; //mynotice:我关注的, noticeme:关注我的, blackname: 黑名单
@property (nonatomic) NSInteger page_num;//页数, default=1
@property (nonatomic) NSInteger count_perpage; //页数, default=1

@end

//
//  RequestRank.h
//  EarthIOS
//
//  Created by kys-2 on 15-3-21.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import "RequestBean.h"

@interface RequestRank : RequestBean

@property (nonatomic,strong) NSString *kind; //wealth:财富榜, richer:土豪榜, beauty: 魅力榜

@property (nonatomic) int sex; //0: 不限性别 1:男性 2:女性  default=0

@property (nonatomic) int page_num; //页数, default=1

@property (nonatomic) int count_perpage; //每页记录数目, default=10

@end

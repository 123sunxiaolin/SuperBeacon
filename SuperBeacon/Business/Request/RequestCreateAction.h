//
//  RequestCreateAction.h
//  EarthIOS
//
//  Created by kys-2 on 15-3-21.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import "RequestBean.h"

@interface RequestCreateAction : RequestBean

@property (nonatomic) int require_male; //活动对象 1: 帅哥 2: 美女
@property (nonatomic) int require_kind; //需求类型
//    1   心灵鸡汤一碗
//    2   天籁之音一首
//    3   闲聊唠嗑一晚
//    4   受气沙包一个
//    5   泡妞宝典一部
//    6   钓凯攻略一组
//    7   畅谈人生一宿
//    8   安慰受伤的心
//    9   剖析女票心理
//    10  解析男票行为
//    11  分享喜悦心情
//    12  倾听工作委屈
@property (nonatomic) int cost_ring_count; //耗费戒指数目
@property (nonatomic) int cost_flower_count; //耗费鲜花数目
@property (nonatomic) int cost_heart_count; //耗费红心数目



@end

//
//  Action.h
//  EarthIOS
//
//  Created by Xiaohui on 15/3/20.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import "Core.h"

@interface Action : MantleBean

@property (nonatomic, readonly) NSInteger id;
@property (nonatomic, readonly) NSInteger status;
@property (nonatomic, readonly) NSInteger user_id;
@property (nonatomic, readonly) NSInteger cost_heart_count;
@property (nonatomic, readonly) NSInteger cost_ring_count;
@property (nonatomic, readonly) NSInteger cost_flower_count;
@property (nonatomic, readonly, strong) NSString *starter_avatar_url;
@property (nonatomic, readonly, strong) NSString *starter_idencode_3party;
@property (nonatomic, readonly, strong) NSString *starter_nick;
@property (nonatomic, readonly, strong) NSString *title; //活动标题
@property (nonatomic, readonly) NSString *create_at;
@property (nonatomic, readonly) NSString *expire_at; //yyyy-mm-dd HH:ii:ss 活动过期时间
@property (nonatomic, readonly) NSInteger part_count; //参与人数
@property (nonatomic, readonly) NSArray *participant_avatar_urls;
@property (nonatomic, readonly, strong) NSString *require_kind_name;
@property (nonatomic, readonly, strong) NSString *require_male_name;
@property (nonatomic, readonly) NSInteger require_kind;
@property (nonatomic, readonly) NSInteger require_male;

@end

//
//  ResponseUserDetail.h
//  EarthIOS
//
//  Created by 徐淮杰 on 15/3/21.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import "ResponseBean.h"

@interface ResponseUserDetail : ResponseBean

@property (nonatomic, readonly, strong) NSString *nick_remark;
@property (nonatomic, readonly, strong) NSArray *album_list;
@property (nonatomic, readonly, assign) BOOL is_blackname;
@property (nonatomic, readonly, assign) BOOL is_attension;
@property (nonatomic, readonly, assign) NSInteger is_vip;
@property (nonatomic, readonly, assign) NSInteger sex;
@property (nonatomic, readonly, strong) NSString *voice_url;
@property (nonatomic, readonly, assign) NSInteger user_id;
@property (nonatomic, readonly, strong) NSString *idencode_3party;
@property (nonatomic, readonly, assign) NSInteger wealth;
@property (nonatomic, readonly, assign) NSInteger ring_count;
@property (nonatomic, readonly, assign) NSInteger age;
@property (nonatomic, readonly, strong) NSString *nick;
@property (nonatomic, readonly, strong) NSString *avatar_url;
@property (nonatomic, readonly, assign) NSInteger flower_count;
@property (nonatomic, readonly, assign) NSInteger heart_count;

@end

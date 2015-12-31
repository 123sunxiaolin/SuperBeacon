//
//  User.h
//  EarthIOS
//
//  Created by 徐淮杰 on 15/3/21.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import "MantleBean.h"

@interface User : MantleBean

@property (nonatomic, readonly) NSInteger user_id;
@property (nonatomic, readonly, strong) NSString *idencode_3party;
@property (nonatomic, readonly, strong) NSString *user_nick;
@property (nonatomic, readonly, strong) NSString *user_avatar_url;
@property (nonatomic, readonly, strong) NSString *user_voice_url;
@property (nonatomic, readonly) NSInteger wealth;
@property (nonatomic, readonly) NSInteger ring_count;
@property (nonatomic, readonly) NSInteger flower_count;
@property (nonatomic, readonly) NSInteger heart_count;
@property (nonatomic, readonly) NSInteger age;
@property (nonatomic, readonly) NSInteger sex;
@property (nonatomic, readonly, assign) BOOL is_attension;
@property (nonatomic, readonly, assign) BOOL is_blackname;

@end

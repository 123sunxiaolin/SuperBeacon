//
//  Person.h
//  EarthIOS
//
//  Created by 徐淮杰 on 15/3/21.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import "MantleBean.h"

@interface Person : MantleBean

@property (nonatomic, readonly, strong) NSString *nick;
@property (nonatomic, readonly, strong) NSString *avatar_url;
@property (nonatomic, readonly, strong) NSString *applier_idencode_3party;
@property (nonatomic, readonly ) NSInteger user_id;
@property (nonatomic, readonly ) NSInteger participant_id;
@property (nonatomic, readonly ) NSInteger ring_count;
@property (nonatomic, readonly ) NSInteger flower_count;
@property (nonatomic, readonly ) NSInteger age;
@property (nonatomic, readonly ) NSInteger heart_count;
@property (nonatomic, readonly ) NSInteger sex;

@end

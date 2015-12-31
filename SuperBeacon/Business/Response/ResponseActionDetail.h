//
//  ResponseActionDetail.h
//  EarthIOS
//
//  Created by 徐淮杰 on 15/3/21.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import "ResponseBean.h"

@interface ResponseActionDetail : ResponseBean


@property (nonatomic, readonly) NSInteger status;
@property (nonatomic, readonly) NSInteger cost_heart_count;
@property (nonatomic, readonly) NSInteger cost_ring_count;
@property (nonatomic, readonly, strong) NSArray *complaint;
@property (nonatomic, readonly, strong) NSString *starter_idencode_3party;
@property (nonatomic, readonly) NSInteger starter_id;
@property (nonatomic, readonly) NSInteger id;
@property (nonatomic, readonly) NSInteger require_kind;
@property (nonatomic, readonly, strong) NSString *require_kind_name;
@property (nonatomic, readonly, strong) NSString *title;
@property (nonatomic, readonly) NSInteger cost_flower_count;
@property (nonatomic, readonly) NSInteger require_male;
@property (nonatomic, readonly) NSDate *expire_at;
@property (nonatomic, readonly) NSArray *participate_users;

@end

//
//  RequestSendPresent.h
//  EarthIOS
//
//  Created by kys-2 on 15-3-21.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import "RequestBean.h"

@interface RequestSendPresent : RequestBean

@property (nonatomic) NSInteger from_user_id;
@property (nonatomic) NSInteger to_user_id;
@property (nonatomic, strong) NSString *to_user_idencode_3party;
@property (nonatomic) NSInteger ring_count;
@property (nonatomic) NSInteger flower_count;
@property (nonatomic) NSInteger heart_count;

@end

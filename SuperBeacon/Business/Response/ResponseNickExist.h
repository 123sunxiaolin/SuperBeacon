//
//  ResponseNickExist.h
//  EarthIOS
//
//  Created by 徐淮杰 on 15/3/21.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import "ResponseBean.h"

@interface ResponseNickExist : ResponseBean

@property (nonatomic, readonly) BOOL user_exist;

@property (nonatomic, readonly) NSInteger user_id;

@property (nonatomic, readonly, strong) NSString * nick;

@end

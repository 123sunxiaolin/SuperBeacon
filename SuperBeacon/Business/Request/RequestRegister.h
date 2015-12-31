//
//  RequestRegister.h
//  EarthIOS
//
//  Created by 徐淮杰 on 15/3/21.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import "RequestBean.h"

@interface RequestRegister : RequestBean

@property (nonatomic, strong) NSString * mobile;  //用户账号
@property (nonatomic, strong) NSString * password; //用户密码
@property (nonatomic, strong) NSString * nick; //昵称
@property (nonatomic, strong) NSString * recommender; //推荐人的id, 0表示没有人推荐
@property (nonatomic, strong) NSString * address; //地址

@end

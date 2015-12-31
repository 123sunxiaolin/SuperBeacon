//
//  RequestWithdraw.h
//  EarthIOS
//
//  Created by kys-2 on 15-3-21.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import "RequestBean.h"

@interface RequestWithdraw : RequestBean
@property (nonatomic) NSInteger ring_count; //戒指数量
@property (nonatomic) NSInteger flower_count; //鲜花数量
@property (nonatomic) NSInteger heart_count; //红心数量
@property (nonatomic, strong) NSString *alipay_account; //支付宝帐号
@property (nonatomic, strong) NSString *alipay_name; //支付宝名称
@end

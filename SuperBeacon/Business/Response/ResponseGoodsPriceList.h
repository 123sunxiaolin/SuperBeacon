//
//  ResponseGoodsPriceList.h
//  EarthIOS
//
//  Created by 徐淮杰 on 15/3/21.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import "ResponseBean.h"

@interface ResponseGoodsPriceList : ResponseBean

@property (nonatomic, readonly) NSInteger ring; //戒指价格
@property (nonatomic, readonly) NSInteger flower; //鲜花价格
@property (nonatomic, readonly) NSInteger heart; //红心价格
@property (nonatomic, readonly) NSInteger member_1m; //1个月会员价格
@property (nonatomic, readonly) NSInteger member_3m; //3个月会员价格
@property (nonatomic, readonly) NSInteger member_12m; //1年期会员价格

@end

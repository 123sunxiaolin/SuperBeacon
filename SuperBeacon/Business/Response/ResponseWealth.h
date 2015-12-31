//
//  ResponseWealth.h
//  EarthIOS
//
//  Created by 徐淮杰 on 15/3/21.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import "ResponseBean.h"

@interface ResponseWealth : ResponseBean

@property (nonatomic, readonly) NSInteger wealth_ring_count; //财富中的戒指数目
@property (nonatomic, readonly) NSInteger wealth_flower_count; //财富中的鲜花数目
@property (nonatomic, readonly) NSInteger wealth_heart_count; //财富中的红心数目
@property (nonatomic, readonly) NSInteger purchase_ring_count; //购买戒指数目
@property (nonatomic, readonly) NSInteger purchase_flower_count; //购买鲜花数目
@property (nonatomic, readonly) NSInteger purchase_heart_count; //购买红心数目
@property (nonatomic, readonly) NSInteger withdraw_ring_count; //取现戒指数目
@property (nonatomic, readonly) NSInteger withdraw_flower_count; //取现鲜花数目
@property (nonatomic, readonly) NSInteger withdraw_heart_count; //取现红心数目
@property (nonatomic, readonly) NSInteger out_ring_count; //送出戒指数目
@property (nonatomic, readonly) NSInteger out_flower_count; //送出鲜花数目
@property (nonatomic, readonly) NSInteger out_heart_count; //送出红心数目
@property (nonatomic, readonly) NSInteger in_ring_count; //获赠戒指数目
@property (nonatomic, readonly) NSInteger in_flower_count; //获赠鲜花数目
@property (nonatomic, readonly) NSInteger in_heart_count; //获赠红心数目

@end

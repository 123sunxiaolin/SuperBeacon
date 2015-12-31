//
//  ResponseWithdrawPriceList.h
//  EarthIOS
//
//  Created by 徐淮杰 on 15/3/21.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import "ResponseBean.h"

@interface ResponseWithdrawPriceList : ResponseBean
@property (nonatomic, readonly) float ring; //戒指价格
@property (nonatomic, readonly) float flower; //鲜花价格
@property (nonatomic, readonly) float heart; //红心价格
@end

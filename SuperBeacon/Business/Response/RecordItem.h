//
//  RecordItem.h
//  EarthIOS
//
//  Created by kys-2 on 15-3-22.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import "MantleBean.h"

@interface RecordItem : MantleBean

@property (nonatomic, readonly) float price; //提现价格
@property (nonatomic, readonly, strong) NSString *action_at; //提现时间, yyyy-mm-dd
@property (nonatomic, readonly) NSInteger status; //提现状态 1:提交, 2:正在处理, 3:处理完成, 4:拒绝
@end

//
//  RequestWithdrawRecordList.h
//  EarthIOS
//
//  Created by kys-2 on 15-3-21.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import "RequestBean.h"

@interface RequestWithdrawRecordList : RequestBean

@property (nonatomic) NSInteger page_num; //页数, default=1
@property (nonatomic) NSInteger count_perpage; //每页记录数目, default=10

@end

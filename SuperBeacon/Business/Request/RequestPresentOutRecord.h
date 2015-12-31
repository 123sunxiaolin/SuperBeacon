//
//  RequestPresentOutRecord.h
//  EarthIOS
//
//  Created by kys－1 on 15-4-16.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import "RequestBean.h"

@interface RequestPresentOutRecord : RequestBean
@property (nonatomic) NSInteger page_num; //页数, default=1
@property (nonatomic) NSInteger count_perpage; //每页记录数目, default=10
@end

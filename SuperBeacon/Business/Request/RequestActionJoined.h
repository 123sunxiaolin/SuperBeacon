//
//  RequestActionJoined.h
//  EarthIOS
//
//  Created by kys-2 on 15-3-21.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import "RequestBean.h"

@interface RequestActionJoined : RequestBean

@property (nonatomic) NSInteger applier_id;
@property (nonatomic) NSInteger page_num;
@property (nonatomic) NSInteger count_perpage;

@end

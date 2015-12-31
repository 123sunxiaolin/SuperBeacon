//
//  RequestFollow.h
//  EarthIOS
//
//  Created by kys-2 on 15-3-21.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import "RequestBean.h"

@interface RequestFollow : RequestBean

@property (nonatomic, assign) BOOL is_actived;
@property (nonatomic) int user_id;

@end

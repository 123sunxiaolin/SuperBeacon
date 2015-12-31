//
//  RequestAppVersion.h
//  EarthIOS
//
//  Created by kys-2 on 15-3-22.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import "RequestBean.h"

@interface RequestAppVersion : RequestBean
@property (nonatomic, strong) NSString * device_type; 
@property (nonatomic, strong) NSString * current_version; //手机号
@end

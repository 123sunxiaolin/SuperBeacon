//
//  ResponseAppVersion.h
//  EarthIOS
//
//  Created by kys-2 on 15-3-22.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import "ResponseBean.h"

@interface ResponseAppVersion : ResponseBean
@property (nonatomic, assign) BOOL need_update;//是否需要升级
@property (nonatomic, assign) BOOL force_update;
@property (nonatomic, strong) NSString *extral_url;
@end

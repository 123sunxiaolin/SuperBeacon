//
//  RequestChangePassword.h
//  SuperBeacon
//
//  Created by kys－1 on 15-5-7.
//  Copyright (c) 2015年 孙晓林. All rights reserved.
//

#import "RequestBean.h"

@interface RequestChangePassword : RequestBean
@property (nonatomic, strong) NSString *mobile;
@property (nonatomic, strong) NSString *password;
@end

//
//  RequestRemark.h
//  EarthIOS
//
//  Created by kys-2 on 15-3-22.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import "RequestBean.h"

@interface RequestRemark : RequestBean
@property (nonatomic) NSInteger nick_user_id;
@property (nonatomic, strong) NSString *remark;//备注
@end

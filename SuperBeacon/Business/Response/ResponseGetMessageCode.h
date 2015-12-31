//
//  ResponseGetMessageCode.h
//  EarthIOS
//
//  Created by 徐淮杰 on 15/3/21.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import "ResponseBean.h"

@interface ResponseGetMessageCode : ResponseBean

@property (nonatomic, readonly) NSString *record_id; //短信记录的id
@property (nonatomic, readonly) NSString *mobile; //手机号
@property (nonatomic, readonly) NSString *iden_code; //短信验证码识别码

@end

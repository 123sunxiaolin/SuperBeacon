//
//  RequestValidateMessageCode.h
//  EarthIOS
//
//  Created by 徐淮杰 on 15/3/21.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import "RequestBean.h"

@interface RequestValidateMessageCode : RequestBean

@property (nonatomic) NSInteger record_id;

@property (nonatomic, strong) NSString *mobile;

@property (nonatomic, strong) NSString *code;

@end

//
//  Response.h
//  EarthIOS
//
//  Created by Xiaohui on 15/3/1.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//


#import "Core.h"

@interface ResponseBean : MantleBean

@property (nonatomic, readonly) NSInteger code;
@property (nonatomic, readonly, strong) NSString *message;

- (void)afterParse;
@end

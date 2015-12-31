//
//  RequestRemark.m
//  EarthIOS
//
//  Created by kys-2 on 15-3-22.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import "RequestRemark.h"
#import "ResponseRemark.h"
#import "Path.h"
@implementation RequestRemark
- (Class)responseClass
{
    return [ResponseRemark class];
}

- (NSString *)path
{
    return Remark;
}
@end

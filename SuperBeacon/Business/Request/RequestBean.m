//
//  Request.m
//  EarthIOS
//
//  Created by Xiaohui on 15/3/1.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import "RequestBean.h"

@implementation RequestBean

- (NSDictionary *)toJsonDictionary
{
    return [MTLJSONAdapter JSONDictionaryFromModel:self];
}

- (Class)responseClass
{
    return nil;
}

- (NSString *)path
{
    return nil;
}

- (BOOL)needToken
{
    return NO;
}

@end

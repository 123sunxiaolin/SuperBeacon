//
//  RequestDelegate.h
//  EarthIOS
//
//  Created by Xiaohui on 15/2/26.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RequestDelegate <NSObject>

@required
- (Class)responseClass;
- (NSString *)path;
- (NSDictionary *)toJsonDictionary;
- (BOOL)needToken;

@optional
- (NSInteger)verify;
- (NSArray *)dataArray;

@end
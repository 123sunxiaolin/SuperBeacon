//
//  Request.h
//  EarthIOS
//
//  Created by Xiaohui on 15/3/1.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Enum.h"

@class RequestBean;
@class ResponseBean;

typedef void (^SuccessBlock)(RequestBean *request, id response);
typedef void (^FailureBlock)(RequestBean *request, NSInteger errorCode, NSString *message);


@interface RequestWrapper : NSObject


@property (nonatomic) HttpMethodEnum httpMethod;
@property (nonatomic, weak) id delegate;

- (id)initWithBean:(RequestBean *)bean
           success:(SuccessBlock)success
           failure:(FailureBlock)failure;

- (NSString *)path;
- (NSDictionary *)urlParameters;
- (NSDictionary *)body;
- (NSArray *)dataArray;
- (void)deliverResponse:(id)networkResponse;
- (void)deliverError:(NSError *)error;

@end

@protocol ResponseDelegate <NSObject>

- (void)onSuccess:(RequestBean *)request response:(ResponseBean *)response;
- (void)onFailure:(RequestBean *)request errorCode:(NSInteger)errorCode;

@end

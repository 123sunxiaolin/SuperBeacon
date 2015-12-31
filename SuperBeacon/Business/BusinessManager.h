//
//  BusinessManager.h
//  EarthIOS
//
//  Created by Xiaohui on 15/2/26.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Core.h"
//#import "AlipayPresenter.h"

@class RequestBean;
@class ResponseBean;
@class Product;

@interface BusinessManager : NSObject

SYNTHESIZE_SINGLETON_FOR_HEADER(BusinessManager)

- (void)get:(RequestBean *)requestBean
    success:(void (^)(RequestBean *request, ResponseBean *response))success
    failure:(void (^)(RequestBean *request, NSInteger errorCode, NSString *message))failure;

- (void)post:(RequestBean *)requestBean
     success:(void (^)(RequestBean *request, ResponseBean *response))success
     failure:(void (^)(RequestBean *request, NSInteger errorCode, NSString *message))failure;

- (void)mutiplePost:(RequestBean *)requestBean
            success:(void (^)(RequestBean *, ResponseBean *))success
            failure:(void (^)(RequestBean *, NSInteger, NSString *))failure;

//- (void)pay:(Product *)product callback:(CompletionBlock)completionBlock;

@end

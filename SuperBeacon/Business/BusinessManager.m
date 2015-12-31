//
//  BusinessManager.m
//  EarthIOS
//
//  Created by Xiaohui on 15/2/26.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import "BusinessManager.h"
#import "Request/RequestBean.h"
#import "Response/ResponseBean.h"
#import "NetworkClient.h"
#import "RequestWrapper.h"

@interface BusinessManager () {
    NetworkClient *_networkClient;
    //AlipayPresenter *_alipayPresenter;
}
@end

@implementation BusinessManager

SYNTHESIZE_SINGLETON_FOR_CLASS(BusinessManager)

- (id)init
{
    self = [super init];
    if (self) {
        _networkClient = [[NetworkClient alloc] init];
        //_alipayPresenter = [[AlipayPresenter alloc] init];
    }
    
    return self;
}

- (void)get:(RequestBean *)requestBean
    success:(void (^)(RequestBean *request, ResponseBean *response))success
    failure:(void (^)(RequestBean *request, NSInteger errorCode, NSString *message))failure
{
    RequestWrapper *request = [[RequestWrapper alloc] initWithBean:requestBean
                                                           success:success
                                                           failure:failure];
    request.httpMethod = HttpGet;
    [_networkClient request:request];
}

- (void)post:(RequestBean *)requestBean
     success:(void (^)(RequestBean *request, ResponseBean *response))success
     failure:(void (^)(RequestBean *request, NSInteger errorCode, NSString *message))failure
{
    RequestWrapper *request = [[RequestWrapper alloc] initWithBean:requestBean
                                                           success:success
                                                           failure:failure];
    request.httpMethod = HttpPost;
    [_networkClient request:request];
}

- (void)mutiplePost:(RequestBean *)requestBean
            success:(void (^)(RequestBean *, ResponseBean *))success
            failure:(void (^)(RequestBean *, NSInteger, NSString *))failure
{
    RequestWrapper *request = [[RequestWrapper alloc] initWithBean:requestBean
                                                           success:success
                                                           failure:failure];
    if ([request dataArray]) {
        request.httpMethod = HttpMutiplePost;
    } else {
        request.httpMethod = HttpPost;
    }
    [_networkClient request:request];
}

//- (void)pay:(Product *)product callback:(CompletionBlock)completionBlock
//{
//    [_alipayPresenter pay:product callback:completionBlock];
//}

@end

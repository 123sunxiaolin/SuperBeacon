//
//  Request.m
//  EarthIOS
//
//  Created by Xiaohui on 15/3/1.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import "RequestWrapper.h"
#import "Request/RequestBean.h"
#import "Response/ResponseBean.h"
#import "Code.h"
#import "T4Marco.h"
#import "UserManager.h"

@interface RequestWrapper ()
{
    RequestBean *_bean;
    SuccessBlock _successBlock;
    FailureBlock _failureBlock;
}
@end

@implementation RequestWrapper

- (id)initWithBean:(RequestBean *)bean
           success:(SuccessBlock)success
           failure:(FailureBlock)failure
{
    self = [super init];
    if (self) {
        _bean = bean;
        _successBlock = success;
        _failureBlock = failure;
    }
    return self;
}

- (NSDictionary *)urlParameters
{
    NSDictionary *dict = [NSMutableDictionary dictionary];
    if ([_bean needToken]) {
        //[dict setValue:[UserManager sharedInstance].rongToken forKey:@"token"];
    }
    if (self.httpMethod == HttpGet) {
        [dict setValuesForKeysWithDictionary:[_bean toJsonDictionary]];
    }
    return dict;
}

- (NSDictionary *)body
{
    if (self.httpMethod == HttpGet) {
        return nil;
    } else {
        return [_bean toJsonDictionary];
    }
}

- (NSString *)path
{
    return [_bean path];
}

- (NSArray *)dataArray
{
    if ([_bean respondsToSelector:@selector(dataArray)]) {
        return [_bean dataArray];
    }
    return nil;
}

- (void)onSuccess:(id)response
{
    _successBlock(_bean, response);
}

- (void)onFailure:(NSInteger)code message:(NSString *)message
{
    _failureBlock(_bean, code, message);
}

- (void)deliverResponse:(id)networkResponse
{
    [self parseNetworkResponse:networkResponse];
}

- (void)deliverError:(NSError *)error
{
    [self onFailure:Failure message:nil];
}

- (void)parseNetworkResponse:(id)networkResponse
{
    NSParameterAssert(T4_CHECK_CLASS(networkResponse, NSDictionary));
    T4_LOG_INFO(@"response:%@", networkResponse);
    NSError *error;
    id response = [MTLJSONAdapter modelOfClass:[_bean responseClass]
                            fromJSONDictionary:networkResponse
                                         error:&error];
    if (error != nil) {
        [self onFailure:Failure message:nil];
        return;
    }
    
    //NSParameterAssert(T4_CHECK_SUBCLASS(response, ResponseBean));
    ResponseBean *resp = (ResponseBean *)response;
    [resp afterParse];
    if (resp.code != Success) {
        [self onFailure:resp.code message:resp.message];
        return;
    }
    
    [self onSuccess:response];
}

@end

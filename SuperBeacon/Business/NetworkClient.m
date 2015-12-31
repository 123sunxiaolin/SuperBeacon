//
//  NetworkClient.m
//  EarthIOS
//
//  Created by Xiaohui on 15/3/1.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import "NetworkClient.h"
#import "AFHTTPSessionManager.h"
#import "AFHTTPRequestOperationManager.h"
#import "Path.h"
#import "RequestWrapper.h"
#import "T4Marco.h"
#import <Mantle/Mantle.h>

@interface NetworkClient ()
{
    AFHTTPSessionManager *_httpSessionManager;
}
@end

@implementation NetworkClient

- (id)init
{
    self = [super init];
    if (self) {
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        [config setHTTPAdditionalHeaders:@{ @"User-Agent" : @"TeamE_Flying iOS 1.0"}];
        
        //设置我们的缓存大小 其中内存缓存大小设置10M  磁盘缓存5M
        NSURLCache *cache = [[NSURLCache alloc] initWithMemoryCapacity:10 * 1024 * 1024
                                                          diskCapacity:5 * 1024 * 1024
                                                              diskPath:nil];
        [config setURLCache:cache];
        _httpSessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:Host]
                                                       sessionConfiguration:config];
        _httpSessionManager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        _httpSessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
        _httpSessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
        //_httpSessionManager.responseSerializer = [AFJSONResponseSerializer serializer];
    }
    
    return self;
}

- (void)request:(RequestWrapper *)request
{
    void (^successBlock)(NSURLSessionDataTask *, id) = ^(NSURLSessionDataTask *task, id data) {
        [request deliverResponse:data];
    };
    
    void (^failureBlock)(NSURLSessionDataTask *, NSError *) = ^(NSURLSessionDataTask *task, NSError *error) {
        [request deliverError:error];
    };

    T4_LOG_INFO(@"path:%@", [request path]);
    T4_LOG_INFO(@"urlParameters:%@", [request urlParameters]);
    T4_LOG_INFO(@"request:%@", [request body]);
    
    switch (request.httpMethod) {
        case HttpGet:
            [_httpSessionManager GET:[request path]
                          parameters:[request urlParameters]
                             success:successBlock
                             failure:failureBlock];
            break;
        case HttpPost:
            [_httpSessionManager POST:[self generatePath:request]
                           parameters:[request body]
                              success:successBlock
                              failure:failureBlock];
            break;
        case HttpMutiplePost: {
            [_httpSessionManager POST:[self generatePath:request]
                           parameters:[request body]
            constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
                NSData* data = [@"{}" dataUsingEncoding:NSUTF8StringEncoding];
                [formData appendPartWithFormData:data name:@"data"];
                for (UploadFileInfo *fileInfo in [request dataArray]) {
                    [formData appendPartWithFileData:fileInfo.data
                                                name:fileInfo.fileName
                                            fileName:fileInfo.fileName
                                            mimeType:fileInfo.mineType];
                }
            } success:successBlock failure:failureBlock];
            break;
        }
        default:
            T4_LOG_ERROR(@"undefine method = %d", request.httpMethod);
            break;
    }
}

- (NSString *)generatePath:(RequestWrapper *)request
{
    NSString *path = [request path];
    NSDictionary *parameters = [request urlParameters];
    
    NSMutableString *query = [NSMutableString stringWithString:@""];
    
    NSArray *parameterNames = [parameters allKeys];
    for (NSString *parameterName in parameterNames) {
        id value = [parameters objectForKey:parameterName];
        NSParameterAssert(T4_CHECK_CLASS(parameterName, [NSString class]));
        NSParameterAssert(T4_CHECK_CLASS(value, [NSString class]));
        
        if ([query length] == 0) {
            [query appendFormat:@"%@=%@", parameterName, value];
        } else {
            [query appendFormat:@"&%@=%@", parameterName, value];
        }
    }
    
    if ([query length] == 0) {
        return path;
    }
    //NSLog(@"%@",[path stringByAppendingFormat:@"?%@", query]);
    return [path stringByAppendingFormat:@"?%@", query];
}

@end

@implementation UploadFileInfo

@end

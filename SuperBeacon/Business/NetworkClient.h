//
//  NetworkClient.h
//  EarthIOS
//
//  Created by Xiaohui on 15/3/1.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Enum.h"

@class RequestWrapper;

@interface NetworkClient : NSObject

- (void)request:(RequestWrapper *)request;

@end

@interface UploadFileInfo :NSObject

@property (nonatomic,strong) NSString *fileName;
@property (nonatomic,strong) NSData *data;
@property (nonatomic,strong) NSString *mineType;

@end

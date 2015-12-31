//
//  RequestPresentOutRecord.m
//  EarthIOS
//
//  Created by kys－1 on 15-4-16.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import "RequestPresentOutRecord.h"
#import "ResponsePresentRecord.h"
#import "Path.h"

@implementation RequestPresentOutRecord
- (Class)responseClass
{
    return [ResponsePresentRecord class];
}

- (NSString *)path
{
    return PresentOutRecord;
}
@end

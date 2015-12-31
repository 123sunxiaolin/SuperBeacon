//
//  NSString+Utils.h
//  Here
//
//  Created by Xiaohui Chen on 13-7-25.
//  Copyright (c) 2013年 Team4.us. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Utils)

//去除字符两端的空格
- (NSString *)trim;

//不区分大小写比较
- (BOOL)isCaseInsensitiveEqualToString:(NSString *)aString;

- (BOOL)validatePhone;

+ (NSString *)cacheRootPath;
+ (NSString *)cacheImagePath;
+ (NSString *)cacheVoicePath;
@end


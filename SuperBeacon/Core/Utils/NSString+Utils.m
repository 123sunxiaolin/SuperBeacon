//
//  NSString+Utils.m
//  Here
//
//  Created by Xiaohui Chen on 13-7-25.
//  Copyright (c) 2013年 Team4.us. All rights reserved.
//

#import "NSString+Utils.h"

@implementation NSString (Utils)

- (NSString *)trim
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (BOOL)isCaseInsensitiveEqualToString:(NSString *)aString
{
    return ([self caseInsensitiveCompare:aString] == NSOrderedSame);
}

- (BOOL)validatePhone
{
    NSRegularExpression *regex
    = [NSRegularExpression regularExpressionWithPattern:@"^(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$"
                                              options:NSRegularExpressionCaseInsensitive
                                                error:nil];
    NSArray *array = [regex matchesInString:self
                                    options:0
                                      range:NSMakeRange(0, [self length])];
    
    return array.count > 0;
}

+ (NSString *)cacheRootPath
{
    return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
}

+ (NSString *)cacheImagePath
{
    NSString *path = [NSString stringWithFormat:@"%@%@", [NSString cacheRootPath], @"/earth/images/"];
    [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
    return path;
}
+ (NSString *)cacheVoicePath
{
    NSString *path = [NSString stringWithFormat:@"%@%@", [NSString cacheRootPath], @"/earth/voices/"];
    [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
    return path;
}

@end

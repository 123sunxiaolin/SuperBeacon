//
//  NSDate+Utils.m
//  EBooking
//
//  Created by Xiaohui Chen on 13-6-19.
//  Copyright (c) 2013年 Team4.us. All rights reserved.
//

#import "NSDate+Utils.h"

@implementation NSDate (Utils)

static NSDateFormatter *dateFormatter = nil;

+ (NSDateFormatter *)dateFormatterWithFormat:(NSString *)format
{
    if (dateFormatter == nil) {
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.timeZone = [NSTimeZone systemTimeZone];
    }
    dateFormatter.dateFormat = format;
    return dateFormatter;
}

- (NSString *)shortTime //23:59
{
    return [self stringWithFormatter:@"HH:mm"];
}

- (NSString *)shortDate
{
    return [self stringWithFormatter:@"yyyy-MM-dd"];
}

- (NSString *)stringWithFormatter:(NSString *)formatter
{
    NSDateFormatter *dateFormatter = [NSDate dateFormatterWithFormat:formatter];
    return [dateFormatter stringFromDate:self];
}

+ (NSDate *)dateFromString:(NSString *)text formatter:(NSString *)formatter
{
    NSDateFormatter *dateFormatter = [NSDate dateFormatterWithFormat:formatter];
    return [dateFormatter dateFromString:text];
}

//yyyy-MM-dd HH:mm:ss
+ (NSDate *)toLongDate:(NSString *)text
{
    return [NSDate dateFromString:text formatter:@"yyyy-MM-dd HH:mm:ss"];
}

//yyyy-MM-dd
+ (NSDate *)toShortDate:(NSString *)text
{
    return [NSDate dateFromString:text formatter:@"yyyy-MM-dd"];
}

@end

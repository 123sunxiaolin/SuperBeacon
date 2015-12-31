//
//  NSDate+Utils.h
//  EBooking
//
//  Created by Xiaohui Chen on 13-6-19.
//  Copyright (c) 2013年 Team4.us. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Utils)

//23:59
- (NSString *)shortTime;
//yyyy-MM-dd
- (NSString *)shortDate;
//yyyy-MM-dd HH:mm:ss
- (NSString *)stringWithFormatter:(NSString *)formatter;

+ (NSDate *)toLongDate:(NSString *)text;
//yyyy-MM-dd
+ (NSDate *)toShortDate:(NSString *)text;
+ (NSDate *)dateFromString:(NSString *)text formatter:(NSString *)formatter;

@end

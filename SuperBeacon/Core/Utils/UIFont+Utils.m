//
//  UIFont+Utils.m
//  Here
//
//  Created by Xiaohui on 13-8-10.
//  Copyright (c) 2013年 Team4.us. All rights reserved.
//

#import "UIFont+Utils.h"

@implementation UIFont (Utils)

+ (UIFont *)fontWithSize:(CGFloat)size
{
    UIFont *font = [UIFont fontWithName:@"Helvetica"
                                   size:size];
    return font;
}

+ (UIFont *)boldFontWithSize:(CGFloat)size
{
    UIFont *font = [UIFont fontWithName:@"Helvetica-Bold"
                                   size:size];
    return font;
}

@end

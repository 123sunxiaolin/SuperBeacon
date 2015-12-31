//
//  UILabel+Utils.m
//  Here
//
//  Created by Xiaohui Chen on 13-7-25.
//  Copyright (c) 2013年 Team4.us. All rights reserved.
//

#import "UILabel+Utils.h"
#import "T4Marco.h"

@implementation UILabel (Utils)

+ (UILabel *)labelWithFrame:(CGRect)frame
                       font:(UIFont *)font
              textAlignment:(NSTextAlignment)textAlignment
                  textColor:(UIColor *)color
       highlightedTextColor:(UIColor *)highlightedColor
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.backgroundColor = T4_COLOR_CLEAR;
    label.font = font;
    label.textColor = color;
    if (highlightedColor == nil) {
        highlightedColor = T4_COLOR_WHITE;
    }
    label.highlightedTextColor = highlightedColor;
    label.textAlignment = textAlignment;
    return label;
}

- (CGSize)sizeOfText
{
    return [self.text sizeWithFont:self.font
                 constrainedToSize:CGSizeMake(self.frame.size.width, MAXFLOAT)
                     lineBreakMode:UILineBreakModeWordWrap];
}

@end

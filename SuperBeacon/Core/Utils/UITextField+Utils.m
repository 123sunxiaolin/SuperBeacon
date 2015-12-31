//
//  UITextField+Utils.m
//  SuperBeacon
//
//  Created by kys－1 on 15-5-10.
//  Copyright (c) 2015年 孙晓林. All rights reserved.
//

#import "UITextField+Utils.h"

@implementation UITextField (Utils)
+ (UITextField *)textFieldWithFrame:(CGRect)frame
                               font:(UIFont *)font
                      textAlignment:(NSTextAlignment)textAlignment
                          textColor:(UIColor *)color
                        placeholder:(NSString *)placeholder
                       keyboardType:(UIKeyboardType)type{
    UITextField *textField = [[UITextField alloc] initWithFrame:frame];
    textField.font = font;
    textField.textColor = color;
    textField.textAlignment = textAlignment;
    if (placeholder) {
        textField.placeholder = placeholder;
    }
    if (type) {
        textField.keyboardType = type;
    }
    return textField;

}
@end

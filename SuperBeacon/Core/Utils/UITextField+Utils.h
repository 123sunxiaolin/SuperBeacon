//
//  UITextField+Utils.h
//  SuperBeacon
//
//  Created by kys－1 on 15-5-10.
//  Copyright (c) 2015年 孙晓林. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (Utils)
+ (UITextField *)textFieldWithFrame:(CGRect)frame
                       font:(UIFont *)font
              textAlignment:(NSTextAlignment)textAlignment
                  textColor:(UIColor *)color
                placeholder:(NSString *)placeholder
               keyboardType:(UIKeyboardType)type;
@end

//
//  UILabel+Utils.h
//  Here
//
//  Created by Xiaohui Chen on 13-7-25.
//  Copyright (c) 2013年 Team4.us. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Utils)

+ (UILabel *)labelWithFrame:(CGRect)frame
                       font:(UIFont *)font
              textAlignment:(NSTextAlignment)textAlignment
                  textColor:(UIColor *)color
       highlightedTextColor:(UIColor *)highlightedColor;

//根据Label的text和font计算所需的width和height
- (CGSize)sizeOfText;

@end

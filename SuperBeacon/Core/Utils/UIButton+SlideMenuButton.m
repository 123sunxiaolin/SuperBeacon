//
//  UIButton+SlideMenuButton.m
//  EarthIOS
//
//  Created by Darren Yau on 10/4/15.
//  Copyright (c) 2015 Duno Tech. All rights reserved.
//

#import "UIButton+SlideMenuButton.h"
#import "Header.h"

@implementation UIButton (SlideMenuButton)


+ (UIButton *)buttonWithFrame:(CGRect)frame
                                iconName:(NSString *)imageName
                               title:(NSString *)title
{
    UIButton *btn = [[UIButton alloc] initWithFrame:frame];
    btn.backgroundColor = T4_COLOR_CLEAR;
    btn.titleFont = [UIFont systemFontOfSize:18.0f];
    [btn setTitleColor:T4_COLOR_WHITE];
    [btn setTitle:title];
    [btn setImageWithName:imageName insets:UIEdgeInsetsMake(0, 0, 0, 20.0f)];
    
    return btn;
}

+ (UIButton *)optionButtonWithFrame:(CGRect)frame
                           iconName:(NSString *)imageName
                              title:(NSString *)title{
    
    UIImage *image = [UIImage imageNamed:imageName];
    CGSize imageSize = image.size;
    UIFont *font = [UIFont systemFontOfSize:12.0f];
    CGSize titleSize = [title sizeWithAttributes:@{NSFontAttributeName:font}];
    CGSize btnSize = frame.size;
    
    UIButton *btn = [[UIButton alloc] initWithFrame:frame];
    btn.backgroundColor = T4_COLOR_WHITE;
    btn.titleFont = font;
    [btn setTitleColor:HEXCOLOR(0x333333)];
    [btn setTitle:title];
    [btn setBackgroundWithImageName:@"skin_highlighted"
               highlightedImageName:@"skin_gray"
                          capInsets:UIEdgeInsetsZero];
    [btn setCornerRadius:1.0 borderColor:HEXCOLOR(0xD7D7D7) borderWidth:0.3];
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    btn.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
    btn.alpha = 1;
    [btn setImageWithName:imageName insets:UIEdgeInsetsMake(20, (btnSize.width - imageSize.width) / 2, 0, 0)];
    [btn setTitleEdgeInsets:UIEdgeInsetsMake(imageSize.height + 30, (btnSize.width - titleSize.width) / 2 - imageSize.width, 0, 0)];
    
    return btn;
}

+ (UIButton *)photoButtonWithFrame:(CGRect)frame
                           iconName:(NSString *)imageName
                              title:(NSString *)title{
    
    UIImage *image = [UIImage imageNamed:imageName];
    CGSize imageSize = image.size;
    UIFont *font = [UIFont systemFontOfSize:12.0f];
    CGSize titleSize = [title sizeWithAttributes:@{NSFontAttributeName:font}];
    CGSize btnSize = frame.size;
    
    UIButton *btn = [[UIButton alloc] initWithFrame:frame];
    btn.backgroundColor = T4_COLOR_WHITE;
    btn.titleFont = font;
    [btn setTitleColor:HEXCOLOR(0x333333)];
    [btn setTitle:title];
    [btn setBackgroundWithImageName:@"skin_highlighted"
               highlightedImageName:@"skin_gray"
                          capInsets:UIEdgeInsetsZero];
    [btn setCornerRadius:3.0 borderColor:HEXCOLOR(0xD7D7D7) borderWidth:0.3];
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    btn.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
    btn.alpha = 1;
    
    [btn setImageWithName:imageName insets:UIEdgeInsetsMake(20, (btnSize.width - imageSize.width) / 2, 0, 0)];
    [btn setTitleEdgeInsets:UIEdgeInsetsMake(imageSize.height + 25, (btnSize.width - titleSize.width) / 2 - imageSize.width, 0, 0)];
    
    return btn;
}
@end

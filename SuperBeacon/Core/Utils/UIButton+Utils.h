//
//  UIButton+Utils.h
//  Here
//
//  Created by Xiaohui Chen on 13-7-25.
//  Copyright (c) 2013年 Team4.us. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Utils)

- (void)setTitleColor:(UIColor *)color;
- (void)setTitleColor:(UIColor *)color
        selectedColor:(UIColor *)selectedColor;
- (void)setTitle:(NSString *)title;
- (void)setTitle:(NSString *)title
   selectedTitle:(NSString *)selectedTitle;
- (void)addTarget:(id)target action:(SEL)action;
- (void)removeTarget:(id)target action:(SEL)action;
- (void)setImageWithName:(NSString *)name;
- (void)setImageWithName:(NSString *)name
                  insets:(UIEdgeInsets)insets;
- (void)setBackgroundWithImageName:(NSString *)name;
- (void)setBackgroundWithImageName:(NSString *)name
                         capInsets:(UIEdgeInsets)insets;
- (void)setBackgroundWithImageName:(NSString *)imageName
              highlightedImageName:(NSString *)highlightedImageName
                         capInsets:(UIEdgeInsets)insets;
- (void)setBackgroundWithImageName:(NSString *)imageName
              highlightedImageName:(NSString *)highlightedImageName
                 disabledImageName:(NSString *)disabledImageName
                         capInsets:(UIEdgeInsets)insets;

- (void)enableHighlightedForSubView;

@property (nonatomic, strong) UIFont *titleFont;

@end

//
//  UIButton+Utils.m
//  Core
//
//  Created by Xiaohui Chen on 13-7-25.
//  Copyright (c) 2013年 Team4.us. All rights reserved.
//

#import "UIButton+Utils.h"
#import "T4Marco.h"

@implementation UIButton (Utils)

- (void)setTitleColor:(UIColor *)color
{
    [self setTitleColor:color selectedColor:color];
}

- (void)setTitleColor:(UIColor *)color
        selectedColor:(UIColor *)selectedColor
{
    [self setTitleColor:color forState:UIControlStateNormal];
    [self setTitleColor:selectedColor forState:UIControlStateDisabled];
    [self setTitleColor:selectedColor forState:UIControlStateHighlighted];
    [self setTitleColor:selectedColor forState:UIControlStateSelected];
}

- (void)setTitle:(NSString*)title
{
    [self setTitle:title selectedTitle:title];
}

- (void)setTitle:(NSString *)title
   selectedTitle:(NSString *)selectedTitle
{
    [self setTitle:title forState:UIControlStateNormal];
    [self setTitle:selectedTitle forState:UIControlStateSelected];
    
}

- (void)setBackgroundWithImageName:(NSString *)name
{
    [self setBackgroundWithImageName:name
                        capInsets:UIEdgeInsetsZero];
}

- (void)setBackgroundWithImageName:(NSString *)name
                         capInsets:(UIEdgeInsets)insets
{
    NSString *selectedImageName = [NSString stringWithFormat:@"%@_%@",name,@"selected"];
    NSString *highlightedImageName = [NSString stringWithFormat:@"%@_%@",name,@"highlighted"];
    NSString *disableImageName = [NSString stringWithFormat:@"%@_%@",name,@"disable"];
    UIImage *normalImage = [UIImage imageNamed:name];
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
    UIImage *highlightedImage = [UIImage imageNamed:highlightedImageName];
    UIImage *disableImage = [UIImage imageNamed:disableImageName];
    
    if (!UIEdgeInsetsEqualToEdgeInsets(insets, UIEdgeInsetsZero)) {
        normalImage = [normalImage resizableImageWithCapInsets:insets];
        selectedImage = [selectedImage resizableImageWithCapInsets:insets];
        highlightedImage = [highlightedImage resizableImageWithCapInsets:insets];
        disableImage = [disableImage resizableImageWithCapInsets:insets];
    }
    
    if (selectedImage == nil) {
        selectedImage = normalImage;
    }
    if (highlightedImage == nil) {
        highlightedImage = selectedImage;
    }
    if (disableImage == nil) {
        disableImage = highlightedImage;
    }

    [self setBackgroundImage:normalImage
                    forState:UIControlStateNormal];
    [self setBackgroundImage:disableImage
                    forState:UIControlStateDisabled];
    [self setBackgroundImage:selectedImage
                    forState:UIControlStateSelected];
    [self setBackgroundImage:highlightedImage
                    forState:UIControlStateHighlighted];
}

- (void)setBackgroundWithImageName:(NSString *)imageName
              highlightedImageName:(NSString *)highlightedImageName
                         capInsets:(UIEdgeInsets)insets
{
    UIImage *normalImage = [UIImage imageNamed:imageName];
    UIImage *selectedImage = [UIImage imageNamed:highlightedImageName];
    UIImage *highlightedImage = [UIImage imageNamed:highlightedImageName];
    
    if (!UIEdgeInsetsEqualToEdgeInsets(insets, UIEdgeInsetsZero)) {
        normalImage = [normalImage resizableImageWithCapInsets:insets];
        selectedImage = [selectedImage resizableImageWithCapInsets:insets];
        highlightedImage = [highlightedImage resizableImageWithCapInsets:insets];
    }
    
    if (selectedImage == nil) {
        selectedImage = normalImage;
    }
    if (highlightedImage == nil) {
        highlightedImage = selectedImage;
    }
    
    [self setBackgroundImage:normalImage
                    forState:UIControlStateNormal];
    [self setBackgroundImage:selectedImage
                    forState:UIControlStateSelected];
    [self setBackgroundImage:highlightedImage
                    forState:UIControlStateHighlighted];
}

- (void)setBackgroundWithImageName:(NSString *)imageName
              highlightedImageName:(NSString *)highlightedImageName
                 disabledImageName:(NSString *)disabledImageName
                         capInsets:(UIEdgeInsets)insets
{
    UIImage *normalImage = [UIImage imageNamed:imageName];
    UIImage *selectedImage = [UIImage imageNamed:highlightedImageName];
    UIImage *highlightedImage = [UIImage imageNamed:highlightedImageName];
    UIImage *disabledImage = [UIImage imageNamed:disabledImageName];

    if (!UIEdgeInsetsEqualToEdgeInsets(insets, UIEdgeInsetsZero)) {
        normalImage = [normalImage resizableImageWithCapInsets:insets];
        selectedImage = [selectedImage resizableImageWithCapInsets:insets];
        highlightedImage = [highlightedImage resizableImageWithCapInsets:insets];
        disabledImage = [disabledImage resizableImageWithCapInsets:insets];
    }
    
    if (selectedImage == nil) {
        selectedImage = normalImage;
    }
    if (highlightedImage == nil) {
        highlightedImage = selectedImage;
    }
    if (disabledImage == nil) {
        disabledImage = highlightedImage;
    }
    
    [self setBackgroundImage:normalImage
                    forState:UIControlStateNormal];
    [self setBackgroundImage:selectedImage
                    forState:UIControlStateSelected];
    [self setBackgroundImage:highlightedImage
                    forState:UIControlStateHighlighted];
    [self setBackgroundImage:disabledImage
                    forState:UIControlStateDisabled];
    
}

- (void)setImageWithName:(NSString *)name
{
    [self setImageWithName:name
                    insets:UIEdgeInsetsZero];
}

- (void)setImageWithName:(NSString *)name
                  insets:(UIEdgeInsets)insets
{
    NSString *selectedImageName = [NSString stringWithFormat:@"%@_%@",name,@"selected"];
    NSString *highlightedImageName = [NSString stringWithFormat:@"%@_%@",name,@"highlighted"];
    UIImage *normalImage = [UIImage imageNamed:name];
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
    UIImage *highlightedImage = [UIImage imageNamed:highlightedImageName];
    if (selectedImage == nil) {
        selectedImage = normalImage;
    }
    
    if (highlightedImage == nil) {
        highlightedImage = selectedImage;
    }
    [self setImageEdgeInsets:insets];
    [self setImage:normalImage
          forState:UIControlStateNormal];
    [self setImage:selectedImage
          forState:UIControlStateSelected];
    [self setImage:highlightedImage
          forState:UIControlStateHighlighted];
}

- (void)addTarget:(id)target action:(SEL)action
{
    [self addTarget:target
             action:action
   forControlEvents:UIControlEventTouchUpInside];
}

- (void)removeTarget:(id)target action:(SEL)action
{
    [self removeTarget:target
                action:action
      forControlEvents:UIControlEventTouchUpInside];
}

- (void)enableHighlightedForSubView
{
    [self addTarget:self
             action:@selector(onTouchForSelection:)
   forControlEvents:UIControlEventTouchDown];
    [self addTarget:self
             action:@selector(onTouchForDeselect:)
   forControlEvents:UIControlEventTouchUpInside];
    [self addTarget:self
             action:@selector(onTouchForSelection:)
   forControlEvents:UIControlEventTouchDragEnter];
    [self addTarget:self
             action:@selector(onTouchForDeselect:)
   forControlEvents:UIControlEventTouchDragExit];
}

- (void)onTouchForSelection:(id)sender
{
    [self setHighlightedForSubView:YES];
}

- (void)onTouchForDeselect:(id)sender
{
    [self setHighlightedForSubView:NO];
}

- (void)setHighlightedForSubView:(BOOL)highlighted
{
    for (UIView *view in self.subviews) {
        if (T4_CHECK_CLASS(view, UILabel)) {
            UILabel *label = (UILabel *)view;
            label.highlighted = highlighted;
        } else if (T4_CHECK_CLASS(view, UIImageView)) {
            UIImageView *imageView = (UIImageView *)view;
            imageView.highlighted = highlighted;
        }
    }
}

- (UIFont *)titleFont
{
    return self.titleLabel.font;
}

- (void)setTitleFont:(UIFont *)font
{
    self.titleLabel.font = font;
}

@end

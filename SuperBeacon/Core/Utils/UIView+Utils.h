//
//  UIView+Utils.h
//  Here
//
//  Created by Xiaohui Chen on 13-7-29.
//  Copyright (c) 2013年 Team4.us. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Utils)

+ (UIView *)oneLineViewWithColor:(UIColor *)color;
+ (UIView *)twoLineViewWithColor:(UIColor *)aColor
                    anotherColor:(UIColor *)anotherColor;

//Move methods

- (void)moveHorizontal:(CGFloat)horizontal
              vertical:(CGFloat)vertical;

- (void)moveHorizontal:(CGFloat)horizontal
              vertical:(CGFloat)vertical
              addWidth:(CGFloat)widthAdded
             addHeight:(CGFloat)heightAdded;

- (void)moveToHorizontal:(CGFloat)horizontal
              toVertical:(CGFloat)vertical;

- (void)moveToHorizontal:(CGFloat)horizontal
              toVertical:(CGFloat)vertical
                setWidth:(CGFloat)width
               setHeight:(CGFloat)height;

//Set width/height

- (void)setWidth:(CGFloat)width
          height:(CGFloat)height;

- (void)setWidth:(CGFloat)width;

- (void)setHeight:(CGFloat)height;

//Add width/height

- (void)addWidth:(CGFloat)widthAdded
       addHeight:(CGFloat)heightAdded;

- (void)addWidth:(CGFloat)widthAdded;

- (void)addHeight:(CGFloat)heightAdded;

//Set corner radius

- (void)setCornerRadius:(CGFloat)radius;

- (void)setCornerRadius:(CGFloat)radius
            borderColor:(UIColor *)borderColor;
- (void)setCornerRadius:(CGFloat)radius
            borderColor:(UIColor *)borderColor
            borderWidth:(CGFloat)borderWidth;


- (CGRect)frameInWindow;

//设置左上角坐标
- (void)setLeftTop:(CGPoint)point;

@end

@interface UIView (Metrics)

+ (CGFloat)heightOfStatusBar;
+ (CGFloat)heightOfNavigationBar;
+ (CGRect)fullBounds;
+ (CGRect)fullBoundsWithoutStatusBar;
+ (CGRect)fullBoundsWithoutNavigationBar;

@end

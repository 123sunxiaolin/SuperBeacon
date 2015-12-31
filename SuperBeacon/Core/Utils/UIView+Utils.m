//
//  UIView+Utils.m
//  Here
//
//  Created by Xiaohui Chen on 13-7-29.
//  Copyright (c) 2013年 Team4.us. All rights reserved.
//

#import "UIView+Utils.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIView (Utils)

+ (UIView *)oneLineViewWithColor:(UIColor *)color
{
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = color;
    
    return lineView;
}

+ (UIView *)twoLineViewWithColor:(UIColor *)aColor
                    anotherColor:(UIColor *)anotherColor
{
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = aColor;
    
    return lineView;
}

- (void)moveHorizontal:(CGFloat)horizontal vertical:(CGFloat)vertical
{
    CGRect origionRect = self.frame;
    CGRect newRect = CGRectMake(origionRect.origin.x + horizontal, origionRect.origin.y + vertical, origionRect.size.width, origionRect.size.height);
    self.frame = newRect;
}

- (void)moveHorizontal:(CGFloat)horizontal vertical:(CGFloat)vertical addWidth:(CGFloat)widthAdded addHeight:(CGFloat)heightAdded
{
    CGRect origionRect = self.frame;
    CGRect newRect = CGRectMake(origionRect.origin.x + horizontal,
                                origionRect.origin.y + vertical,
                                origionRect.size.width + widthAdded,
                                origionRect.size.height + heightAdded);
    self.frame = newRect;
}

- (void)moveToHorizontal:(CGFloat)horizontal toVertical:(CGFloat)vertical
{
    CGRect origionRect = self.frame;
    CGRect newRect = CGRectMake(horizontal, vertical, origionRect.size.width, origionRect.size.height);
    self.frame = newRect;
}

- (void)moveToHorizontal:(CGFloat)horizontal toVertical:(CGFloat)vertical setWidth:(CGFloat)width setHeight:(CGFloat)height
{
    CGRect newRect = CGRectMake(horizontal, vertical, width, height);
    self.frame = newRect;
}

- (void)setWidth:(CGFloat)width height:(CGFloat)height
{
    CGRect origionRect = self.frame;
    CGRect newRect = CGRectMake(origionRect.origin.x, origionRect.origin.y, width, height);
    self.frame = newRect;
}

- (void)setWidth:(CGFloat)width
{
    CGRect origionRect = self.frame;
    CGRect newRect = CGRectMake(origionRect.origin.x, origionRect.origin.y, width, origionRect.size.height);
    self.frame = newRect;
}

- (void)setHeight:(CGFloat)height
{
    CGRect origionRect = self.frame;
    CGRect newRect = CGRectMake(origionRect.origin.x, origionRect.origin.y, origionRect.size.width, height);
    self.frame = newRect;
}

- (void)addWidth:(CGFloat)widthAdded addHeight:(CGFloat)heightAdded
{
    CGRect originRect = self.frame;
    CGFloat newWidth = originRect.size.width + widthAdded;
    CGFloat newHeight = originRect.size.height + heightAdded;
    CGRect newRect = CGRectMake(originRect.origin.x, originRect.origin.y, newWidth, newHeight);
    self.frame = newRect;
}

- (void)addWidth:(CGFloat)widthAdded
{
    [self addWidth:widthAdded addHeight:0];
}

- (void)addHeight:(CGFloat)heightAdded
{
    [self addWidth:0 addHeight:heightAdded];
}

- (void)setCornerRadius:(CGFloat)radius
{
    [self setCornerRadius:radius borderColor:[UIColor grayColor]];
}

- (void)setCornerRadius:(CGFloat)radius borderColor:(UIColor *)borderColor
{
    [self setCornerRadius:radius
              borderColor:borderColor
              borderWidth:1.0];
}

- (void)setCornerRadius:(CGFloat)radius
            borderColor:(UIColor *)borderColor
            borderWidth:(CGFloat)borderWidth
{
    [self.layer setBackgroundColor:[[UIColor whiteColor] CGColor]];
    [self.layer setBorderColor:[borderColor CGColor]];
    [self.layer setBorderWidth:borderWidth];
    [self.layer setCornerRadius:radius];
    [self.layer setMasksToBounds:YES];
    self.clipsToBounds = YES;
}

- (CGRect)frameInWindow
{
    CGRect frameInWindow = [self.superview convertRect:self.frame
                                                toView:self.window];
    return frameInWindow;
}

- (void)setLeftTop:(CGPoint)point
{
    CGFloat x = point.x + self.frame.size.width / 2.0f;
    CGFloat y = point.y + self.frame.size.height / 2.0f;
    self.center = CGPointMake(x, y);
}

@end

@implementation UIView (Metrics)

+ (CGFloat)heightOfStatusBar
{
    CGRect statusBarFrame = [[UIApplication sharedApplication] statusBarFrame];
    CGFloat statusBarHeight = MIN(statusBarFrame.size.width, statusBarFrame.size.height);
    return statusBarHeight;
}

+ (CGFloat)heightOfNavigationBar
{
    return 44.0f;
}

+ (CGRect)fullBounds
{
    CGRect screenBounds = [UIScreen mainScreen].bounds;
    return screenBounds;
}

+ (CGRect)fullBoundsWithoutStatusBar
{
    CGRect fullBounds = [UIView fullBounds];
    CGFloat heightOfStatusBar = [UIView heightOfStatusBar];
    CGFloat x = 0.0f;
    CGFloat y = 0.0f;
    CGFloat width = fullBounds.size.width;
    CGFloat height = fullBounds.size.height - heightOfStatusBar;
    return CGRectMake(x, y, width, height);
}

+ (CGRect)fullBoundsWithoutNavigationBar
{
    CGRect fullBounds = [UIView fullBounds];
    CGFloat heightOfStatusBar = [UIView heightOfStatusBar];
    CGFloat heightOfNavigationBar = [UIView heightOfNavigationBar];
    CGFloat x = 0.0f;
    CGFloat y = 0.0f;
    CGFloat width = fullBounds.size.width;
    CGFloat height = fullBounds.size.height - heightOfStatusBar - heightOfNavigationBar;
    return CGRectMake(x, y, width, height);
}

@end

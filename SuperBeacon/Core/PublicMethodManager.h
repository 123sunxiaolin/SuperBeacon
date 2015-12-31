//
//  PublicMethodManager.h
//  SuperBeacon
//
//  Created by kys-2 on 15-3-30.
//  Copyright (c) 2015年 孙晓林. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SynthesizeSingleton.h"
#import <UIKit/UIKit.h>

@interface PublicMethodManager : NSObject
SYNTHESIZE_SINGLETON_FOR_HEADER(PublicMethodManager)

/*
 *对图片进行高斯模糊处理
 */
- (UIImage *)blurryImage:(UIImage *)image withBlurLevel:(CGFloat)blur;

/*
 *使UIImageView裁剪后显示
 */
- (UIImage *)cutImage:(UIImage*)image
   WithImageViewWidth:(CGFloat)width
  WithImageViewHeight:(CGFloat)height;

/*
 *调节字间距
 */
- (NSMutableAttributedString *)adjustLabel_LineSpacingWithString:(NSString *)Str
                                                  ForLineSpacing:(NSInteger)Spacing;

/*
 *计算文字所占的尺寸
 */
- (CGSize)GetSizeFromString:(NSString *)string withAttributes:(NSDictionary *)attributes;

/*
 *绘制圆形头像
 */
- (UIImage *)roundImageWithImageName:(NSString *)name
                         borderWidth:(CGFloat)borderWidth
                         borderColor:(UIColor *)borderCorlor;

- (UIImage *)roundImageWithImage:(UIImage *)oldImage
                     borderWidth:(CGFloat)borderWidth
                     borderColor:(UIColor *)borderCorlor;

@end

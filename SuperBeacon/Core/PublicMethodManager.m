//
//  PublicMethodManager.m
//  SuperBeacon
//
//  Created by kys-2 on 15-3-30.
//  Copyright (c) 2015年 孙晓林. All rights reserved.
//

#import "PublicMethodManager.h"
#import <Accelerate/Accelerate.h>

@implementation PublicMethodManager
SYNTHESIZE_SINGLETON_FOR_CLASS(PublicMethodManager)

- (UIImage *)blurryImage:(UIImage *)image withBlurLevel:(CGFloat)blur {
    if (blur < 0.f || blur > 1.f) {
        blur = 0.5f;
    }
    int boxSize = (int)(blur * 100);
    boxSize = boxSize - (boxSize % 2) + 1;
    
    CGImageRef img = image.CGImage;
    
    vImage_Buffer inBuffer ;
    vImage_Buffer outBuffer ;
    vImage_Error error;
    
    void *pixelBuffer;
    
    CGDataProviderRef inProvider = CGImageGetDataProvider(img);
    CFDataRef inBitmapData = CGDataProviderCopyData(inProvider);
    
    inBuffer.width = CGImageGetWidth(img);
    inBuffer.height = CGImageGetHeight(img);
    inBuffer.rowBytes = CGImageGetBytesPerRow(img);
    
    //不支持iOS7及以下
    inBuffer.data = (void*)CFDataGetBytePtr( inBitmapData);
    
    pixelBuffer = malloc(CGImageGetBytesPerRow(img) *
                         CGImageGetHeight(img));
    
    if(pixelBuffer == NULL)
        NSLog(@"No pixelbuffer");
    
    outBuffer.data = pixelBuffer;
    outBuffer.width = CGImageGetWidth(img);
    outBuffer.height = CGImageGetHeight(img);
    outBuffer.rowBytes = CGImageGetBytesPerRow(img);
    
    error = vImageBoxConvolve_ARGB8888(&inBuffer,
                                       &outBuffer,
                                       NULL,
                                       0,
                                       0,
                                       boxSize,
                                       boxSize,
                                       NULL,
                                       kvImageEdgeExtend);
    
    
    if (error) {
        NSLog(@"error from convolution %ld", error);
    }
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef ctx = CGBitmapContextCreate(
                                             outBuffer.data,
                                             outBuffer.width,
                                             outBuffer.height,
                                             8,
                                             outBuffer.rowBytes,
                                             colorSpace,
                                             kCGImageAlphaNoneSkipLast);
    CGImageRef imageRef = CGBitmapContextCreateImage (ctx);
    UIImage *returnImage = [UIImage imageWithCGImage:imageRef];
    
    //clean up
    CGContextRelease(ctx);
    CGColorSpaceRelease(colorSpace);
    
    free(pixelBuffer);
    CFRelease(inBitmapData);
    
    CGColorSpaceRelease(colorSpace);
    CGImageRelease(imageRef);
    
    return returnImage;
}

- (UIImage *)cutImage:(UIImage*)image
   WithImageViewWidth:(CGFloat)width
  WithImageViewHeight:(CGFloat)height
{//裁剪展览图片
    
    CGSize newSize;
    CGImageRef imageRef = nil;
    
    if ((image.size.width / image.size.height) < (width / height)) {
        newSize.width = image.size.width;
        newSize.height = image.size.width * height / width;
        
        imageRef = CGImageCreateWithImageInRect([image CGImage], CGRectMake(0, fabs(image.size.height - newSize.height) / 2, newSize.width, newSize.height));
        
    } else {
        newSize.height = image.size.height;
        newSize.width = image.size.height * width / height;
        
        imageRef = CGImageCreateWithImageInRect([image CGImage], CGRectMake(fabs(image.size.width - newSize.width) / 2, 0, newSize.width, newSize.height));
        
    }
    
    return [UIImage imageWithCGImage:imageRef];
}

- (NSMutableAttributedString *)adjustLabel_LineSpacingWithString:(NSString *)Str  ForLineSpacing:(NSInteger)Spacing
{
    NSMutableAttributedString *attributeText = [[NSMutableAttributedString alloc] initWithString:Str];
    //设置文字样式
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    // 行间距10个像素
    [style setLineSpacing:Spacing];
    //字符串应用样式
    [attributeText addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, [Str length])];
    // 注意：不能设置label.text = attributeText
    return attributeText;
}

- (CGSize)GetSizeFromString:(NSString *)string withAttributes:(NSDictionary *)attributes
{
    /* NSDictionary *attributes = @{NSFontAttributeName: [UIFont fontWithName:@"Helvetica" size:15]};*/
    // 计算文本的大小
    CGSize textSize = [string boundingRectWithSize:CGSizeMake(MAXFLOAT, 30) // 用于计算文本绘制时占据的矩形块
                                           options: NSStringDrawingUsesLineFragmentOrigin // 文本绘制时的附加选项
                                        attributes:attributes        // 文字的属性
                                           context:nil].size; // context上下文。包括一些信息，例如如何调整字间距以及缩放。该对象包含的信息将用于文本绘制。该参数可为nil
    return textSize;
}

- (UIImage *)roundImageWithImageName:(NSString *)name
                         borderWidth:(CGFloat)borderWidth
                         borderColor:(UIColor *)borderCorlor{
    //加载原图
    UIImage *oldImage = [UIImage imageNamed:name];
    //开启上下文
    CGFloat imageWidth = oldImage.size.width + 22 * borderWidth;
    CGFloat imageHeight = oldImage.size.height + 22 * borderWidth;
    CGSize imageSize = CGSizeMake(imageWidth, imageHeight);
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0.0);
    //取得当前的上下文，即获得那个图片的上下文
    CGContextRef ctr = UIGraphicsGetCurrentContext();
    //画边框
    [borderCorlor set];
    CGFloat bigRadius = imageWidth * 0.5;//大圆半径
    CGFloat centerX = bigRadius;
    CGFloat centerY = bigRadius;
    CGContextAddArc(ctr, centerX, centerY, bigRadius, 0, M_PI * 2, 0);
    CGContextFillPath(ctr);
    //小圆
    CGFloat smallRadius = bigRadius - borderWidth;
    CGContextAddArc(ctr, centerX, centerY, smallRadius, 0, M_PI * 2, 0);
    //裁剪
    CGContextClip(ctr);
    //画图
    [oldImage drawInRect:CGRectMake(borderWidth, borderWidth, oldImage.size.width, oldImage.size.height)];
    //取图
    UIImage *newimage = UIGraphicsGetImageFromCurrentImageContext();
    //结束上下文
    UIGraphicsEndImageContext();
    return newimage;
}

- (UIImage *)roundImageWithImage:(UIImage *)oldImage
                     borderWidth:(CGFloat)borderWidth
                     borderColor:(UIColor *)borderCorlor{
    //加载原图
    //UIImage *oldImage = [UIImage imageNamed:name];
    //开启上下文
    CGFloat imageWidth = oldImage.size.width + 22 * borderWidth;
    CGFloat imageHeight = oldImage.size.height + 22 * borderWidth;
    CGSize imageSize = CGSizeMake(imageWidth, imageHeight);
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0.0);
    //取得当前的上下文，即获得那个图片的上下文
    CGContextRef ctr = UIGraphicsGetCurrentContext();
    //画边框
    [borderCorlor set];
    CGFloat bigRadius = imageWidth * 0.5;//大圆半径
    CGFloat centerX = bigRadius;
    CGFloat centerY = bigRadius;
    CGContextAddArc(ctr, centerX, centerY, bigRadius, 0, M_PI * 2, 0);
    CGContextFillPath(ctr);
    //小圆
    CGFloat smallRadius = bigRadius - borderWidth;
    CGContextAddArc(ctr, centerX, centerY, smallRadius, 0, M_PI * 2, 0);
    //裁剪
    CGContextClip(ctr);
    //画图
    [oldImage drawInRect:CGRectMake(borderWidth, borderWidth, oldImage.size.width, oldImage.size.height)];
    //取图
    UIImage *newimage = UIGraphicsGetImageFromCurrentImageContext();
    //结束上下文
    UIGraphicsEndImageContext();
    return newimage;

}
@end

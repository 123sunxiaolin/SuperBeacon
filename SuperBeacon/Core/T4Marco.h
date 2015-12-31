//
//  T4Marco.h
//  Core
//
//  Created by Xiaohui Chen on 13-7-25.
//  Copyright (c) 2013年 Team4.us. All rights reserved.
//

#ifndef Core_T4MARCO_h
#define Core_T4MARCO_h

#import "SynthesizeSingleton.h"
#import "NIDebuggingTools.h"

#pragma mark - LOG

#define T4_LOG_ERROR(frmt, ...) NSLog(frmt, ##__VA_ARGS__)
#define T4_LOG_WARN(frmt, ...) NSLog(frmt, ##__VA_ARGS__)
#define T4_LOG_INFO(frmt, ...) NSLog(frmt, ##__VA_ARGS__)
#define T4_LOG_FUNC() NIDPRINTMETHODNAME()
#define T4_CONDITION_LOG(condition, xx, ...) NIDCONDITIONLOG(condition, xx, ##__VA_ARGS__)

#pragma mark - Color

#define HEXCOLOR(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define T4_COLOR(_r, _g, _b) RGBCOLOR(_r, _g, _b)
#define T4_COLOR_WITH_ALPHA(_r, _g, _b, _a) RGBACOLOR(_r, _g, _b, _a)
#define T4_COLOR_CLEAR [UIColor clearColor]
#define T4_COLOR_WHITE [UIColor whiteColor] //FFFFFF
#define T4_COLOR_BLACK [UIColor blackColor] //000000

#pragma mark - Size
#define IS_IPHONE4 [[UIScreen mainScreen] bounds].size.height == 480.f
#define IS_IPHONE5 [[UIScreen mainScreen] bounds].size.height == 568.f
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height
#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define STATEBARHEIGHT 20

#define MAIN_HEIGHT (IOS7_OR_LATER ? SCREEN_HEIGHT:(SCREEN_HEIGHT - STATEBARHEIGHT))
#define MAIN_WIDTH SCREEN_WIDTH
#define VIEWHEIGHT (IOS7_OR_LATER ? (MAIN_HEIGHT-64):(MAIN_HEIGHT-44))

#pragma mark - BackButton Or PublishButton
#define kPublishBtnWidth 40
#define kPublishBtnHeight 30
#define kBlurLevel 0.155
#define kNavBarHeight 64

#pragma mark - Check

//判断一个对象是否为空
#define T4_CHECK_NIL(_object) \
        (_object == nil || [_object isKindOfClass:[NSNull class]])

//判断一个对象是否属于指定类型
#define T4_CHECK_CLASS(_object, _class) \
        (!T4_CHECK_NIL(_object) \
        && [_object isKindOfClass:[_class class]])

//判断一个对象是否实现了指定协议
#define T4_CHECK_PROTOCOL(_object, _protocol) \
        (!T4_CHECK_NIL(_object) \
        && [_object conformsToProtocol:@protocol(_protocol)])

//判断一个对象是否为某个类的子类
#define T4_CHECK_SUBCLASS(_object, _class) \
        (!T4_CHECK_NIL(_object) \
        && [_object isSubclassOfClass:[_class class]])


#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)

#endif

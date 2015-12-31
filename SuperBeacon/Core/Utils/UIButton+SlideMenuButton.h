//
//  UIButton+SlideMenuButton.h
//  EarthIOS
//
//  Created by Darren Yau on 10/4/15.
//  Copyright (c) 2015 Duno Tech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (SlideMenuButton)

+ (UIButton *)buttonWithFrame:(CGRect)frame
                     iconName:(NSString *)imageName
                        title:(NSString *)title;
+ (UIButton *)optionButtonWithFrame:(CGRect)frame
                           iconName:(NSString *)imageName
                        title:(NSString *)title;
+ (UIButton *)photoButtonWithFrame:(CGRect)frame
                           iconName:(NSString *)imageName
                              title:(NSString *)title;

@end

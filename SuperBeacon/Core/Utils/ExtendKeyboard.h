//
//  ExtendKeyboard.h
//  Here
//
//  Created by Xiaohui Chen on 13-8-12.
//  Copyright (c) 2013年 Team4.us. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExtendKeyboard: NSObject

+ (ExtendKeyboard *)addExtendKeyboardViewToParentView:(UIView *)parentView;

- (void)reloadAllTextFieldsFromParentView;

@end

//
//  CountView.h
//  EarthIOS
//
//  Created by Darren Yau on 12/4/15.
//  Copyright (c) 2015 Duno Tech. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CountView;

@protocol CountViewDelegate <NSObject>

- (void)valueWillAdd:(CountView *)countView;
- (void)valueWillSub:(CountView *)countView;
- (void)valueDidChange:(CountView *)countView;

@end

@interface CountView : UIView

@property (nonatomic) NSInteger currentValue;
@property (nonatomic) NSInteger minValue;
@property (nonatomic) NSInteger maxValue;
@property (nonatomic) NSUInteger stepValue;
@property (nonatomic, weak) id<CountViewDelegate> delegate;
@property (nonatomic) BOOL isManual;

- (void)updateNewValue;
- (void)updateNewValue:(NSInteger)newValue;

@end

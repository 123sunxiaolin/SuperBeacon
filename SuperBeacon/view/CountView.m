//
//  CountView.m
//  EarthIOS
//
//  Created by Darren Yau on 12/4/15.
//  Copyright (c) 2015 Duno Tech. All rights reserved.
//

#import "CountView.h"
#import "Header.h"

@interface CountView ()
{
    UIButton *_leftButton;
    UIButton *_rightButton;
    UILabel *_countLabel;
    NSInteger _newValue;
}

@end

@implementation CountView

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        T4_LOG_FUNC();
        self.frame = CGRectZero;
        _newValue = 0;
        self.currentValue = 0;
        self.minValue = 0;
        self.maxValue = NSIntegerMax;
        self.stepValue = 1;
        [self loadView];
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        T4_LOG_FUNC();
        _newValue = 0;
        self.currentValue = 0;
        self.minValue = 0;
        self.maxValue = NSIntegerMax;
        self.stepValue = 1;
        [self loadView];
    }
    return self;
}

- (void)loadView
{
    self.backgroundColor = [UIColor clearColor];
    
    CGFloat x = 0.0f;
    CGFloat y = 0.0f;
    CGFloat width = 30;
    CGFloat height = 24;
    CGRect rect = CGRectMake(x, y, width, height);
    
    _leftButton = [[UIButton alloc] initWithFrame:rect];
    [_leftButton addTarget:self
                    action:@selector(onClickLeft:)];
    [_leftButton setBackgroundWithImageName:@"count_minus"];
    _leftButton.center = CGPointMake(CGRectGetWidth(_leftButton.frame)/2.0, CGRectGetHeight(self.frame)/2.0f);
    [self addSubview:_leftButton];
    
    x = width;
    y = CGRectGetMinY(_leftButton.frame);
    width = 50;
    rect = CGRectMake(x, y, width, height);
    _countLabel = [UILabel labelWithFrame:rect
                                     font:[UIFont fontWithSize:17.0f]
                            textAlignment:NSTextAlignmentCenter
                                textColor:[UIColor blackColor]
                     highlightedTextColor:nil];
    _countLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:_countLabel];
    
    x = x + width;
    width = 30;
    rect = CGRectMake(x, y, width, height);
    _rightButton = [[UIButton alloc] initWithFrame:rect];
    [_rightButton addTarget:self
                     action:@selector(onClickRight:)];
    [_rightButton setBackgroundWithImageName:@"count_plus"];
    _rightButton.center = CGPointMake(x + CGRectGetMidX(_rightButton.bounds), _leftButton.center.y);
    [self addSubview:_rightButton];
    
    width = x + width;
    height = self.frame.size.height;
    x = self.frame.origin.x + (self.frame.size.width - width) / 2;
    y = self.frame.origin.y;
    self.frame = CGRectMake(x, y, width, height);
    [self checkValueChange:self.currentValue];
}

- (void)onClickLeft:(id)sender
{
    if ([self.delegate conformsToProtocol: @protocol(CountViewDelegate)]) {
        [self.delegate valueWillSub:self];
    }
    
    if (!self.isManual) {
        [self setValueByManual:self.currentValue - self.stepValue];
    } else {
        _newValue = self.currentValue - self.stepValue;
    }
}

- (void)onClickRight:(id)sender
{
     if ([self.delegate conformsToProtocol: @protocol(CountViewDelegate)]) {
        [self.delegate valueWillAdd:self];
    }
    
    if (!self.isManual) {
        [self setValueByManual:self.currentValue + self.stepValue];
    } else {
        _newValue = self.currentValue + self.stepValue;
    }
}

- (void)checkValueChange:(NSInteger)value
{
    BOOL hasChanged = YES;
    
    if (value > self.minValue && value < self.maxValue) {
        _leftButton.enabled = YES;
        _rightButton.enabled = YES;
        self.currentValue = value;
    } else if (value == self.minValue) {
        self.currentValue = value;
        _leftButton.enabled = NO;
    } else if (value == self.maxValue) {
        self.currentValue = value;
        _rightButton.enabled = NO;
    } else {
        hasChanged = NO;
    }
    
    [_countLabel setText:[NSString stringWithFormat:@"%ld", self.currentValue]];
    
    if (hasChanged && [self.delegate conformsToProtocol: @protocol(CountViewDelegate)]) {
        [self.delegate valueDidChange:self];
    }
}

- (void)setValueByManual:(NSInteger)value
{
    [self checkValueChange:value];
}

- (void)updateNewValue
{
    [self setValueByManual:_newValue];
}
- (void)updateNewValue:(NSInteger)newValue {
    [self setValueByManual:newValue];
}
@end


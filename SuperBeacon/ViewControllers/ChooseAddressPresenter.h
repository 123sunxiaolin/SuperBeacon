//
//  ChooseAddressPresenter.h
//  SuperBeacon
//
//  Created by kys－1 on 15-5-3.
//  Copyright (c) 2015年 孙晓林. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol ChooseAddressDelegate <NSObject>

- (void)onClickAddressChoosed:(NSString *)address;

@end
@interface ChooseAddressPresenter : NSObject
@property (nonatomic, weak) id<ChooseAddressDelegate> delegate;
@property (nonatomic, strong) UIViewController *viewController;
- (void)loadView;
@end

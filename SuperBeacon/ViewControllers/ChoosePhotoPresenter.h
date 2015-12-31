//
//  ChoosePhotoPresenter.h
//  EarthIOS
//
//  Created by Xiaohui on 15/4/13.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "VPImageCropperViewController.h"

@protocol ChoosePhotoDelegate <NSObject>

- (void)choosePhotoDidFinished:(UIImage *)editedImage;

@end

@interface ChoosePhotoPresenter : NSObject

@property (nonatomic, weak) UIViewController *viewController;
@property (nonatomic, weak) id<ChoosePhotoDelegate> delegate;
@property (nonatomic) BOOL needCrop; //是否需要裁减

- (void)showOptions;

@end



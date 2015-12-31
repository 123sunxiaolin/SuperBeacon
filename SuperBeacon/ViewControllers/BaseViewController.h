//
//  T4ViewController.h
//  EarthIOS
//
//  Created by Xiaohui Chen on 13-7-25.
//  Copyright (c) 2013年 Team4.us. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "BaseView.h"
#import "AppDelegate.h"
#import "Header.h"

typedef enum {
    NavButtonNone,
    NavButtonBack,
    NavButtonClear,
    NavButtonCancel,
    NavButtonPublish,
    NavButtonFeedback,
    NavButtonJoin,
    NavButtonDone,
    NavButtonRemark,
    NavButtonParticipaint,
    NavButtonAlbum,
    NavButtonNext,
    NavButtonMenu,
    NavButtonSearch,
    NavButtonX,
} NavButtonType;

typedef enum {
    ControllerAppendModePush = 0,
    ControllerAppendModeAdd,
    ControllerAppendModePresent,
    ControllerAppendModeNewNav,
} ControllerAppendMode;

typedef enum{
    GoodsRecordPurchase = 0,
    GoodsRecordGive,
    GoodsRecordGet,
    GoodsRecordWithdraw,
}GoodsRecordType;

@class T4Bundle;

@interface BaseViewController : UIViewController<UITextFieldDelegate>

@property (nonatomic, strong) T4Bundle *bundle;
@property (nonatomic) ControllerAppendMode mode;

- (id)initWithBundle:(T4Bundle *)bundle;

- (AppDelegate *)app;
- (UIViewController *)showWithClassName:(NSString *)className;
- (UIViewController *)showWithClassName:(NSString *)className
                                 bundle:(T4Bundle *)bundle;
- (UIViewController *)showWithClassName:(NSString *)className
                                   mode:(ControllerAppendMode)mode
                                 bundle:(T4Bundle *)bundle;

//- (BaseView *)addSubViewWithClass:(Class)aClass;
//- (BaseView *)addSubViewWithClass:(Class)aClass toView:(BaseView *)superView;

- (void)back;
- (void)setLeftNavButtonType:(NavButtonType)type;
- (void)setRightNavButtonType:(NavButtonType)type;

@end

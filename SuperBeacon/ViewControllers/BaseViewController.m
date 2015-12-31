//
//  BaseViewController.m
//  EarthIOS
//
//  Created by Darren Yau on 10/4/15.
//  Copyright (c) 2015 Darren Yau. All rights reserved.
//

#import "BaseViewController.h"
//#import "MainViewController.h"
//#import "LaunchViewController.h"
#import "UIImage+Utils.h"
#import "PKRevealController.h"

#define LAUNCH_MAIN_CONTROLLER ([self isKindOfClass:[MainViewController class]] || [self isKindOfClass:[LaunchViewController class]])

@implementation BaseViewController

- (id)initWithBundle:(T4Bundle *)bundle
{
    self = [self init];
    if (self) {
        self.bundle = bundle;
    }    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationController.navigationBar setTitleTextAttributes:
  @{NSFontAttributeName:[UIFont systemFontOfSize:20.0f],
    NSForegroundColorAttributeName:T4_COLOR_WHITE}];
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
//                                                                          action:@selector(dismissKeyboard)];
//    [self.view addGestureRecognizer:tap];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if([[[UIDevice currentDevice]systemVersion]floatValue] >= 7.0)
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleLightContent;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:HEXCOLOR(0xF8356E)] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    /*[self.navigationController setNavigationBarHidden:LAUNCH_MAIN_CONTROLLER ? YES : NO animated:YES];*/
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

//-(void)dismissKeyboard
//{
//    [self.view endEditing:YES];
//}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.view endEditing:YES];
    return YES;
}

#pragma mark - public function

- (AppDelegate *)app
{
    return (AppDelegate *)[UIApplication sharedApplication].delegate;
}

//- (BaseView *)addSubViewWithClass:(Class)aClass
//{
//    CGRect frame = [self isKindOfClass:[MainViewController class]] ? self.view.bounds : [BaseView FrameOfView];
//    BaseView *view = [[aClass alloc] initWithFrame: frame withController:self];
//    [self.view addSubview:view];
//    
//    return view;
//}
//
//- (BaseView *)addSubViewWithClass:(Class)aClass toView:(BaseView *)superView
//{
//    CGRect rect = [BaseView FullBounds];
//    rect.origin.y += NAV_HEIGHT;
//    rect.size.height -= (NAV_HEIGHT * 2);
//    
//    BaseView *view = [[aClass alloc] initWithFrame:rect withController:self];
//    [superView addSubview:view];
//    
//    return view;
//}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (UIViewController *)showWithClassName:(NSString *)className
{
    return [self showWithClassName:className bundle:nil];
}

- (UIViewController *)showWithClassName:(NSString *)className
                                 bundle:(T4Bundle *)bundle
{
    return [self showWithClassName:className
                              mode:ControllerAppendModePush
                            bundle:bundle];
}

- (UIViewController *)showWithClassName:(NSString *)className
                                   mode:(ControllerAppendMode)mode
                                 bundle:(T4Bundle *)bundle
{
    Class c = NSClassFromString(className);
    NSAssert(c != nil, @"未找到对应的Class(%@)", className);
    NSAssert([c isSubclassOfClass:[BaseViewController class]], @"Class(%@)必须是BaseViewController的子类", className);
    BaseViewController *controller = [[c alloc] initWithBundle:bundle];
    controller.mode = mode;
    if (mode == ControllerAppendModeAdd) {
        [self.navigationController addChildViewController:controller];
        [self.navigationController.view addSubview:controller.view];
    } else if (mode == ControllerAppendModeNewNav) {
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:controller];
        [self presentViewController:nav animated:YES completion:nil];
    } else if (mode == ControllerAppendModePresent) {
        [self.navigationController presentViewController:controller
                                                animated:YES
                                              completion:nil];
    } else {
        [self.navigationController pushViewController:controller
                                             animated:YES];
        if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
            self.navigationController.interactivePopGestureRecognizer.delegate = nil;
        }
    }
    return controller;
}

- (void)setLeftNavButtonType:(NavButtonType)type
{
    NSArray *items = [self navigationBarItemsWithType:type];
    self.navigationItem.leftBarButtonItems = items;
}

- (void)setRightNavButtonType:(NavButtonType)type
{
    NSArray *items = [self navigationBarItemsWithType:type];
    self.navigationItem.rightBarButtonItems = items;
}

- (NSArray *)navigationBarItemsWithType:(NavButtonType)type
{
    NSMutableArray *views = [[NSMutableArray alloc] initWithCapacity:2];
    CGFloat x = 0.0f;
    CGFloat y = 0.0f;
    CGFloat width = 58.0f;
    CGFloat height = 44.0f;
    
    if (type == NavButtonClear) {
        UIButton *button = [self buttonWithType:type
                                         action:@selector(onClickClear)
                                      imageName:nil];
        [button setTitle:@"清除"];
        CGSize size = [button.titleLabel.text sizeWithAttributes:@{NSFontAttributeName:button.titleLabel.font}];
        button.frame = CGRectMake(x, y, MAX(width,size.width+10),
                                  button.frame.size.height);
        [button setTitleEdgeInsets:UIEdgeInsetsMake(0, 5, 0, 5)];
        [views addObject:button];
    }
    if (type == NavButtonBack) {
        
        [views addObject:[self buttonWithType:type
                                       action:@selector(onClickBack)
                                    imageName:@"back"]];
    }
    
    if (type == NavButtonAlbum) {
        
        [views addObject:[self buttonWithType:type
                                       action:@selector(onClickAlbum)
                                    imageName:@"相册"]];
    }
    
    if (type == NavButtonCancel) {
        UIButton *button = [self buttonWithType:type
                                         action:@selector(onClickCancel)
                                      imageName:nil];
        [button setTitle:@"取消"];
       CGSize size = [button.titleLabel.text sizeWithAttributes:@{NSFontAttributeName:button.titleLabel.font}];
        button.frame = CGRectMake(x, y, MAX(width,size.width+10),
                                  button.frame.size.height);
        [button setTitleEdgeInsets:UIEdgeInsetsMake(0, 5, 0, 5)];
        [views addObject:button];
    }
    
    if (type == NavButtonRemark) {
        UIButton *button = [self buttonWithType:type
                                         action:@selector(onClickRemark)
                                      imageName:nil];
        [button setTitle:@"备注"];
       CGSize size = [button.titleLabel.text sizeWithAttributes:@{NSFontAttributeName:button.titleLabel.font}];
        button.frame = CGRectMake(x, y, MAX(width,size.width+10),
                                  button.frame.size.height);
        [button setTitleEdgeInsets:UIEdgeInsetsMake(0, 5, 0, 5)];
        [views addObject:button];
    }
    
    if (type == NavButtonParticipaint) {
        UIButton *button = [self buttonWithType:type
                                         action:@selector(onClickParticipaint)
                                      imageName:nil];
        [button setTitle:@"参加"];
        CGSize size = [button.titleLabel.text sizeWithAttributes:@{NSFontAttributeName:button.titleLabel.font}];
        button.frame = CGRectMake(x, y, MAX(width,size.width+10),
                                  button.frame.size.height);
        [button setTitleEdgeInsets:UIEdgeInsetsMake(0, 5, 0, 5)];
        [views addObject:button];
    }
    
    if (type == NavButtonPublish) {
        UIButton *button = [self buttonWithType:type
                                         action:@selector(onClickPublish)
                                      imageName:nil];
        [button setTitle:@"发布"];
        CGSize size = [button.titleLabel.text sizeWithAttributes:@{NSFontAttributeName:button.titleLabel.font}];
        button.frame = CGRectMake(x, y, MAX(width,size.width+10),
                                  button.frame.size.height);
        [button setTitleEdgeInsets:UIEdgeInsetsMake(0, 5, 0, 5)];
        [views addObject:button];
    }
    
    if (type == NavButtonJoin) {
        UIButton *button = [self buttonWithType:type
                                         action:@selector(onClickJoin)
                                      imageName:nil];
        [button setTitle:@"参加"];
     CGSize size = [button.titleLabel.text sizeWithAttributes:@{NSFontAttributeName:button.titleLabel.font}];
        button.frame = CGRectMake(x, y, MAX(width,size.width+10),
                                  button.frame.size.height);
        [button setTitleEdgeInsets:UIEdgeInsetsMake(0, 5, 0, 5)];
        [views addObject:button];
    }

    
    if (type == NavButtonFeedback) {
        UIButton *button = [self buttonWithType:type
                                         action:@selector(onClickFeedback)
                                      imageName:nil];
        [button setTitle:@"投诉"];
        CGSize size = [button.titleLabel.text sizeWithAttributes:@{NSFontAttributeName:button.titleLabel.font}];
        button.frame = CGRectMake(x, y, MAX(width,size.width+10),
                                  button.frame.size.height);
        [button setTitleEdgeInsets:UIEdgeInsetsMake(0, 5, 0, 5)];
        [views addObject:button];
    }
    
    if (type == NavButtonDone) {
        UIButton *button = [self buttonWithType:type
                                         action:@selector(onClickDone)
                                      imageName:nil];
        [button setTitle:@"确定"];
        CGSize size = [button.titleLabel.text sizeWithAttributes:@{NSFontAttributeName:button.titleLabel.font}];
        button.frame = CGRectMake(x, y, MAX(width,size.width+10),
                                  button.frame.size.height);
        [button setTitleEdgeInsets:UIEdgeInsetsMake(0, 5, 0, 5)];
        [views addObject:button];
    }
    
    if (type == NavButtonNext) {
        UIButton *button = [self buttonWithType:type
                                         action:@selector(onClickNext)
                                      imageName:nil];
        [button setTitle:@"下一步"];
        CGSize size = [button.titleLabel.text sizeWithAttributes:@{NSFontAttributeName:button.titleLabel.font}];        button.frame = CGRectMake(x, y, MAX(width,size.width+10),
                                  button.frame.size.height);
        [button setTitleEdgeInsets:UIEdgeInsetsMake(0, 5, 0, 5)];
        [views addObject:button];
    }
    
    if (type == NavButtonMenu) {
        [views addObject:[self buttonWithType:type
                                       action:@selector(onClickMenu)
                                    imageName:@"menu_white_btn"]];
    }
    
    if (type == NavButtonSearch) {
        [views addObject:[self buttonWithType:type
                                       action:@selector(onClickSearch)
                                    imageName:@"sidebar_search"]];
    }
    
    if (type == NavButtonX) {
        [views addObject:[self buttonWithType:type
                                       action:@selector(onClickX)
                                    imageName:@"x_cancel_btn"]];
    }

    
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                                                               target:nil
                                                                               action:nil];
    if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_6_1)
        spaceItem.width = -5.0f;
    else
        spaceItem.width = -16.0f;
    
    UIImageView *imageView = [[UIImageView alloc] init];
    [imageView setUserInteractionEnabled:YES];
    for (UIView *view in views) {
        view.frame = CGRectMake(x, y, view.frame.size.width, height);
        [imageView addSubview:view];
        x += view.frame.size.width;
    }
    imageView.frame = CGRectMake(0.0f, 0.0f, x, height);
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:imageView];
    item.width = imageView.frame.size.width;
    item.tag = type;
    return @[spaceItem, item];
}

- (UIButton *)buttonWithType:(NavButtonType)type
                      action:(SEL)action
                   imageName:(NSString *)imageName
{
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 58.0f, 44.0f)];
    button.showsTouchWhenHighlighted = YES;
    [button addTarget:self
               action:action];
    if (imageName.length > 0) {
        [button setImageWithName:imageName];
    }
    return button;
}

- (void)back
{
    [self backWithAnimated:YES];
    [self.view endEditing:YES];
}

- (void)backWithAnimated:(BOOL)animated
{
    if (self.mode == ControllerAppendModePush) {
        [self.navigationController popViewControllerAnimated:animated];
    } else {
        [self.navigationController dismissViewControllerAnimated:animated
                                                      completion:nil];
    }
}

- (void)onClickBack
{
    T4_LOG_FUNC();
    [self back];
}


- (void)onClickClear
{
    T4_LOG_FUNC();
}


- (void)onClickCancel
{
    T4_LOG_FUNC();
}

- (void)onClickPublish
{
    T4_LOG_FUNC();
}

- (void)onClickJoin
{
    T4_LOG_FUNC();
}

- (void)onClickFeedback
{
    T4_LOG_FUNC();
}

-(void)onClickDone
{
    T4_LOG_FUNC();
}

- (void)onClickRemark
{
    T4_LOG_FUNC();
}

- (void)onClickParticipaint
{
    T4_LOG_FUNC();
}

- (void)onClickAlbum
{
    T4_LOG_FUNC();
}

- (void)onClickNext
{
    T4_LOG_FUNC();
}

- (void)onClickMenu
{
    T4_LOG_FUNC();
    if ([self app].revealController.state == PKRevealControllerShowsLeftViewController ) {
        [self.navigationController.revealController showViewController:self.navigationController.revealController.frontViewController];
    }else{
    [self.navigationController.revealController showViewController:self.navigationController.revealController.leftViewController];
    }
}

- (void)onClickSearch
{
    T4_LOG_FUNC();
}

- (void)onClickX{
    T4_LOG_FUNC();
    [self back];
}

@end

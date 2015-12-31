//
//  ChangePhoneViewController.m
//  SuperBeacon
//
//  Created by kys－1 on 15-5-3.
//  Copyright (c) 2015年 孙晓林. All rights reserved.
//

#import "ChangePhoneViewController.h"
#import "UIView+Utils.h"

@interface ChangePhoneViewController ()
@property (weak, nonatomic) IBOutlet UIView *phoneBackView;
@property (weak, nonatomic) IBOutlet UIView *codeView;

@end

@implementation ChangePhoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"修改手机号";
    self.view.backgroundColor = HEXCOLOR(0xFAFAFA);
    [self setLeftNavButtonType:NavButtonBack];
    [self setRightNavButtonType:NavButtonDone];
    
    [_phoneBackView setCornerRadius:0 borderColor:HEXCOLOR(0xD7D7D7) borderWidth:0.5];
    [_codeView setCornerRadius:0 borderColor:HEXCOLOR(0xD7D7D7) borderWidth:0.5];
    
}

-(void)onClickDone{
    T4_LOG_FUNC();
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

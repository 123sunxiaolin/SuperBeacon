//
//  VipViewController.m
//  SuperBeacon
//
//  Created by kys－1 on 15-5-2.
//  Copyright (c) 2015年 孙晓林. All rights reserved.
//

#import "VipViewController.h"
#import "CountView.h"
#import "UIButton+Utils.h"
#import "TTTAttributedLabel.h"

@interface VipViewController ()<CountViewDelegate, TTTAttributedLabelDelegate>{
    NSInteger _1mPrice;
    NSInteger _12mPrice;
    NSInteger _month;
    NSInteger _total;
}
@property (weak, nonatomic) IBOutlet UILabel *vipPriceLabel;
@property (weak, nonatomic) IBOutlet CountView *countView;
@property (weak, nonatomic) IBOutlet UIButton *purchaseBtn;
@property (weak, nonatomic) IBOutlet TTTAttributedLabel *serviceLabel;

@end

@implementation VipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"开通会员";
    _1mPrice = 10;
    _12mPrice = 100;
    [self setLeftNavButtonType:NavButtonBack];
    _purchaseBtn.enabled = NO;
    [_purchaseBtn addTarget:self action:@selector(onClickPurchaseBtn:)];
    _countView.minValue = 0;
    _countView.maxValue = 12;
    _countView.delegate = self;
    
    _serviceLabel.enabledTextCheckingTypes = NSTextCheckingTypeAddress;
    _serviceLabel.delegate = self;
    [_serviceLabel setText:@"会员服务条款" afterInheritingLabelAttributesAndConfiguringWithBlock:^NSMutableAttributedString *(NSMutableAttributedString *mutableAttributedString) {
        NSRange range = [[NSMutableString string]rangeOfString:@"会员服务条款"];
        [mutableAttributedString addAttribute:(NSString*)kCTForegroundColorAttributeName value:(id)[HEXCOLOR(0x157EFB) CGColor] range:range];
        return mutableAttributedString;
    }];
    [_serviceLabel addLinkToURL:nil withRange:NSMakeRange(0, 6)];
}

- (void)onClickPurchaseBtn:(UIButton *)sender{
    T4_LOG_FUNC();
}

#pragma mark - CountViewDelegate

- (void)valueWillAdd:(CountView *)countView
{
    
}

- (void)valueWillSub:(CountView *)countView
{
    
}

- (void)valueDidChange:(CountView *)countView
{
    _month = countView.currentValue;
    self.purchaseBtn.enabled = (_month > 0);
    if (_month == 12) {
        _total = _12mPrice;
        self.vipPriceLabel.text = [NSString stringWithFormat:@"%ld", _total];
    } else {
        _total = _1mPrice * _month;
        self.vipPriceLabel.text = [NSString stringWithFormat:@"%ld", _total];
    }
}

#pragma mark - TTTAttributedLabelDelegate
- (void)attributedLabel:(TTTAttributedLabel *)label didSelectLinkWithURL:(NSURL *)url
{
    T4_LOG_FUNC();
    //[self showWithClassName:@"AgreeMentViewController"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

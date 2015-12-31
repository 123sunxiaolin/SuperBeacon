//
//  ChooseAddressPresenter.m
//  SuperBeacon
//
//  Created by kys－1 on 15-5-3.
//  Copyright (c) 2015年 孙晓林. All rights reserved.
//

#import "ChooseAddressPresenter.h"
#import "T4Marco.h"
#import "UIButton+Utils.h"
#import "UIView+Utils.h"
#import "UILabel+Utils.h"
#import "UIView+RGSize.h"

@interface ChooseAddressPresenter()<UIPickerViewDataSource, UIPickerViewDelegate>
@property (nonatomic, strong) UIView *backgroundView;
@property (nonatomic, strong) UIView *addressPickerBackView;
@property (nonatomic, strong) UIPickerView *pickerView;
@property (nonatomic, strong) NSArray *compusArray;
@property (nonatomic, strong) NSArray *buildingsArray;
@property (nonatomic, strong) NSArray *roomArray;
@property (nonatomic, strong) NSArray *selectedArray;
@property (strong, nonatomic) NSDictionary *pickerDic;
@end

@implementation ChooseAddressPresenter
- (id)init
{
    self = [super init];
    if (self != nil) {
        [self loadView];
        [self getPickerData];
    }
    return self;
}

- (void)loadView{
    CGFloat x = 0.0;
    CGFloat y = 0.0;
    CGFloat width = SCREEN_WIDTH;
    CGFloat height = SCREEN_HEIGHT;
    CGRect rect = CGRectMake(x, y, width, height);
    _backgroundView = [[UIView alloc]initWithFrame:rect];
    _backgroundView.backgroundColor = [UIColor lightGrayColor];
    _backgroundView.alpha = 0.60;
    [_backgroundView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissAddressPicker)]];
    [_viewController.view addSubview:_backgroundView];
    
    y = SCREEN_HEIGHT - 260;
    height = 260.0;
    rect = CGRectMake(x, y, width, height);
    _addressPickerBackView = [[UIView alloc] initWithFrame:rect];
    _addressPickerBackView.backgroundColor = [UIColor whiteColor];
    [_viewController.view insertSubview:_addressPickerBackView aboveSubview:_backgroundView];
    
    _backgroundView.alpha = 0;
    _addressPickerBackView.top = _viewController.view.height;
    
    [UIView animateWithDuration:0.3 animations:^{
        _backgroundView.alpha = 0.6;
        _addressPickerBackView.bottom = _viewController.view.height;
    }];
    
    x = 0.0;
    y = 0.0;
    width = SCREEN_WIDTH;
    height = 44.f;
    rect = CGRectMake(x, y, width, height);
    UIView *topView = [[UIView alloc]initWithFrame:rect];
    [topView setCornerRadius:0 borderColor:HEXCOLOR(0xD7D7D7) borderWidth:0.5];
    topView.backgroundColor = HEXCOLOR(0xC0C0C0);
    [_addressPickerBackView addSubview:topView];
    
    x = 15.0;
    height = 20.0;
    y = (CGRectGetHeight(topView.frame) - height) / 2;
    width = 30;
    rect = CGRectMake(x, y, width, height);
    UIButton *cancelBtn = [[UIButton alloc] initWithFrame:rect];
    [cancelBtn setTitle:@"取消"];
    [cancelBtn setTitleFont:[UIFont systemFontOfSize:15.0]];
    [cancelBtn setTitleColor:HEXCOLOR(0x0099FF)];
    [cancelBtn addTarget:self action:@selector(onClickCancel:)];
    [topView addSubview:cancelBtn];
    
    width = 100;
    x = (SCREEN_WIDTH - width) / 2;
    height = 20.0;
    rect = CGRectMake(x, y, width, height);
    UILabel *titleLabel = [UILabel labelWithFrame:rect
                                             font:[UIFont systemFontOfSize:16]
                                    textAlignment:NSTextAlignmentLeft
                                        textColor:HEXCOLOR(0x333333)
                             highlightedTextColor:HEXCOLOR(0x333333)];
    titleLabel.text = @"选择详细地址";
    [topView addSubview:titleLabel];
    
    width = 40.f;
    x = SCREEN_WIDTH - 15 - width;
    y = (CGRectGetHeight(topView.frame) - height) / 2;
    rect = CGRectMake(x, y, width, height);
    UIButton *confirmBtn = [[UIButton alloc] initWithFrame:rect];
    [confirmBtn setTitle:@"确定"];
    [cancelBtn setTitleFont:[UIFont systemFontOfSize:15]];
    [confirmBtn setTitleColor:HEXCOLOR(0x0099FF)];
    [confirmBtn addTarget:self action:@selector(onClickConfirm:)];
    [topView addSubview:confirmBtn];
    
    x = 15.f;
    y = CGRectGetMaxY(topView.frame) + 10.f;
    width = SCREEN_WIDTH - x * 2;
    height = CGRectGetHeight(_addressPickerBackView.frame) - y;
    rect = CGRectMake(x, y, width, height);
    _pickerView = [[UIPickerView alloc]initWithFrame:rect];
    _pickerView.backgroundColor = [UIColor clearColor];
    _pickerView.delegate = self;
    _pickerView.dataSource = self;
    [_addressPickerBackView addSubview:_pickerView];
}

- (void)getPickerData {//测试
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Address" ofType:@"plist"];
    _pickerDic = [[NSDictionary alloc] initWithContentsOfFile:path];
    _compusArray = [_pickerDic allKeys];
    _selectedArray = [_pickerDic objectForKey:[_compusArray objectAtIndex:0]];
    if (_selectedArray.count > 0) {
        _buildingsArray = [[_selectedArray objectAtIndex:0] allKeys];
    }
    
    if (_buildingsArray.count > 0) {
        _roomArray = [[_selectedArray objectAtIndex:0] objectForKey:[_buildingsArray objectAtIndex:0]];
    }
}

#pragma mark --------UIPickerViewDatasource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component == 0) {
        return _compusArray.count;
    }else if (component == 1){
        return _buildingsArray.count;
    }else{
        return _roomArray.count;
    }
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    return CGRectGetWidth(_pickerView.frame) / 3.0;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (component == 0) {
        return [_compusArray objectAtIndex:row];
    } else if (component == 1) {
        return [_buildingsArray objectAtIndex:row];
    } else {
        return [_roomArray objectAtIndex:row];
    }}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (component == 0) {
        _selectedArray = [_pickerDic objectForKey:[_compusArray objectAtIndex:row]];
        if (_selectedArray.count > 0) {
            _buildingsArray = [[_selectedArray objectAtIndex:0] allKeys];
        } else {
            _buildingsArray = nil;
        }
        if (_buildingsArray.count > 0) {
            _roomArray = [[_selectedArray objectAtIndex:0] objectForKey:[_buildingsArray objectAtIndex:0]];
        } else {
            _roomArray = nil;
        }
    }
    [pickerView selectedRowInComponent:1];
    [pickerView reloadComponent:1];
    [pickerView selectedRowInComponent:2];
    
    if (component == 1) {
        if (_selectedArray.count > 0 && _buildingsArray.count > 0) {
            _roomArray = [[_selectedArray objectAtIndex:0] objectForKey:[_buildingsArray objectAtIndex:row]];
        } else {
            _roomArray = nil;
        }
        [pickerView selectRow:1 inComponent:2 animated:YES];
    }
    
    [pickerView reloadComponent:2];

    
}

- (void)onClickCancel:(UIButton *)sender{
    T4_LOG_FUNC();
    [self dismissAddressPicker];
    
}

- (void)onClickConfirm:(UIButton *)sender{
    T4_LOG_FUNC();
    NSString *addressStr = [NSString stringWithFormat:@"%@%@%@", _compusArray[[_pickerView selectedRowInComponent:0]], _buildingsArray[[_pickerView selectedRowInComponent:1]], _roomArray[[_pickerView selectedRowInComponent:2]]];
    [_delegate onClickAddressChoosed:addressStr];
    [self dismissAddressPicker];
}
- (void)dismissAddressPicker{
    [UIView animateWithDuration:0.3 animations:^{
        _backgroundView.alpha = 0;
        _addressPickerBackView.top = _viewController.view.height;
    } completion:^(BOOL finished) {
        [_backgroundView removeFromSuperview];
        [_addressPickerBackView removeFromSuperview];
    }];
    
}

@end

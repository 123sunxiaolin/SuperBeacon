//
//  AddPhotoViewController.m
//  SuperBeacon
//
//  Created by kys－1 on 15-5-10.
//  Copyright (c) 2015年 孙晓林. All rights reserved.
//

#import "AddPhotoViewController.h"
#import "UIButton+SlideMenuButton.h"
#import "ChoosePhotoPresenter.h"
#import "UIView+Utils.h"

@interface AddPhotoViewController ()<ChoosePhotoDelegate>{
    ChoosePhotoPresenter *_choosePhotoPresenter;
    NSMutableArray *_addedImagesArray;
}
@property (weak, nonatomic) IBOutlet UIView *cellBackView;
@property (weak, nonatomic) IBOutlet UILabel *cropImageLabel;
@property (weak, nonatomic) IBOutlet UISwitch *isCropSwitch;
@property (strong, nonatomic)UIButton *addPhotoBtn;
@property (strong, nonatomic)UIImageView *addedImageView;
@end

@implementation AddPhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"添加图片";
    [self setLeftNavButtonType:NavButtonBack];
    [self setRightNavButtonType:NavButtonPublish];
    self.view.backgroundColor = HEXCOLOR(0xFAFAFA);
    
    _addedImagesArray = [[NSMutableArray alloc] initWithCapacity:10];
    _choosePhotoPresenter = [[ChoosePhotoPresenter alloc] init];
    _choosePhotoPresenter.viewController = self;
    _choosePhotoPresenter.delegate = self;
    _choosePhotoPresenter.needCrop = YES;
    
    [_cellBackView setCornerRadius:0 borderColor:HEXCOLOR(0xD7D7D7) borderWidth:1.0];
    _cropImageLabel.textColor = HEXCOLOR(0x333333);
    _isCropSwitch.on = YES;
    [_isCropSwitch addTarget:self action:@selector(onSwitchCrop:) forControlEvents:UIControlEventValueChanged];
    
    
    CGFloat x = 5.0f;
    CGFloat y = CGRectGetMaxY(_cellBackView.frame) + 10.f;
    CGFloat width = (SCREEN_WIDTH - 25)/4.0f;
    CGFloat height = width;
    CGRect rect = CGRectMake(x, y, width, height);
    _addPhotoBtn = [UIButton photoButtonWithFrame:rect iconName:@"add" title:@"添加图片"];
    [_addPhotoBtn addTarget:self action:@selector(onClickAddPhoto:)];
    [self.view addSubview:_addPhotoBtn];

    
}

- (void)onClickPublish{
    
}

- (void)onClickAddPhoto:(UIButton *)sender{
    T4_LOG_FUNC();
    [_choosePhotoPresenter showOptions];
}

- (void)onSwitchCrop:(UISwitch *)sender{
    T4_LOG_FUNC();
    _choosePhotoPresenter.needCrop = [sender isOn];
}

#pragma mark - ChoosePhotoDelegate

- (void)choosePhotoDidFinished:(UIImage *)editedImage{
    if (editedImage) {
        [_addedImagesArray addObject:editedImage];
        CGFloat x = CGRectGetMinX(_addPhotoBtn.frame);
        CGFloat y = CGRectGetMinY(_addPhotoBtn.frame);
        CGFloat width = CGRectGetWidth(_addPhotoBtn.frame);
        CGFloat height = width;
        CGRect rect = CGRectMake(x, y, width, height);
        _addedImageView = [[UIImageView alloc] initWithFrame:rect];
        _addedImageView.image = editedImage;
        [self.view addSubview:_addedImageView];
        
        x = CGRectGetMaxX(_addedImageView.frame) + 5.f;
        BOOL next = x >= SCREEN_WIDTH;
        x = next ? 5.0f : x;
        y = next ? CGRectGetMaxY(_addedImageView.frame) + 5.0f : CGRectGetMinY(_addedImageView.frame);
        rect = CGRectMake(x, y, width, height);
        _addPhotoBtn.frame = rect;
        
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

//
//  LocationViewController.m
//  SuperBeacon
//
//  Created by kys－1 on 15-4-1.
//  Copyright (c) 2015年 孙晓林. All rights reserved.
//

#import "MarketViewController.h"
#import "Core.h"
#import "PKRevealController.h"
#import "HYBLoopScrollView.h"
#import "UIButton+SlideMenuButton.h"
#import "UIView+Utils.h"
#import "UIButton+Utils.h"

@interface MarketViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) HYBLoopScrollView *topScrollView;
@property (strong, nonatomic) UITableView *mainInfoTableView;
@end

@implementation MarketViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"卖讯";
    [self setLeftNavButtonType:NavButtonMenu];
    [self setRightNavButtonType:NavButtonSearch];
    CGFloat x = 0.f;
    CGFloat y = 0.f;
    CGFloat width = SCREEN_WIDTH;
    CGFloat height = 330.f;
    CGRect rect = CGRectMake(x, y, width, height);
    UIView *headerView = [[UIView alloc] initWithFrame:rect];
    headerView.backgroundColor = [UIColor clearColor];
    
    NSString *url = @"http://test.meirongzongjian.com/imageServer/user/3/42ccb9c75ccf5e910cd6f5aaf0cd1200.jpg";
    NSArray *images = @[[UIImage imageNamed:@"h1.jpg"],
                        [UIImage imageNamed:@"h2.jpg"],
                        [UIImage imageNamed:@"h3.jpg"],
                        url
                        ];
    
    NSArray *titles = @[@"Thank you for your support!",
                        @"Contact me if any quetion.",
                        @"Email me huangyibiao520@163.com.",
                        @"Thank you again."
                        ];
    x = 0.f;
    y = 0.f;
    height = 120.f;
    rect = CGRectMake(x, y, width, height);
    _topScrollView = [HYBLoopScrollView loopScrollViewWithFrame:rect imageUrls:images];
    _topScrollView.timeInterval = 3;
    _topScrollView.placeholder = [UIImage imageNamed:@"h1.jpg"];
    _topScrollView.didSelectItemBlock = ^(NSInteger atIndex) {
        NSLog(@"clicked item at index: %ld", atIndex);
    };
    _topScrollView.didScrollBlock = ^(NSInteger atIndex) {
        //NSLog(@"scroll to index: %ld", atIndex);
    };
    _topScrollView.alignment = kPageControlAlignRight;
    _topScrollView.adTitles = titles;
    [headerView addSubview:_topScrollView];
    

    y = 130.f;
    width = SCREEN_WIDTH / 4;
    height = width;
    rect = CGRectMake(x, y, width, height);
    UIButton *bookBtn = [UIButton optionButtonWithFrame:rect iconName:@"1" title:@"图书"];
    [bookBtn addTarget:self action:@selector(onClickBook:)];
    [headerView addSubview:bookBtn];
    
    x = width;
    rect = CGRectMake(x, y, width, height);
    UIButton *clothesBtn = [UIButton optionButtonWithFrame:rect iconName:@"2" title:@"衣服"];
    [clothesBtn addTarget:self action:@selector(onClickClothes:)];
    [headerView addSubview:clothesBtn];
    
    x = width * 2;
    rect = CGRectMake(x, y, width, height);
    UIButton *lifeGoodsBtn = [UIButton optionButtonWithFrame:rect iconName:@"3" title:@"生活用品"];
    [lifeGoodsBtn addTarget:self action:@selector(onClickLifeGoods:)];
    [headerView addSubview:lifeGoodsBtn];
    
    x = width * 3;
    rect = CGRectMake(x, y, width, height);
    UIButton *eleDeviceBtn = [UIButton optionButtonWithFrame:rect iconName:@"4" title:@"二手电子"];
    [eleDeviceBtn addTarget:self action:@selector(onClickEleDevice:)];
    [headerView addSubview:eleDeviceBtn];
    
    x = 0;
    y = y + height;
    rect = CGRectMake(x, y, width, height);
    UIButton *bikeBtn = [UIButton optionButtonWithFrame:rect iconName:@"4" title:@"自行车"];
    [bikeBtn addTarget:self action:@selector(onClickBike:)];
    [headerView addSubview:bikeBtn];
    
    x = width;
    rect = CGRectMake(x, y, width, height);
    UIButton *partTimeBtn = [UIButton optionButtonWithFrame:rect iconName:@"3" title:@"兼职"];
    [partTimeBtn addTarget:self action:@selector(onClickPartTime:)];
    [headerView addSubview:partTimeBtn];
    
    x = width * 2;
    rect = CGRectMake(x, y, width, height);
    UIButton *othersBtn = [UIButton optionButtonWithFrame:rect iconName:@"5" title:@"其他"];
    [othersBtn addTarget:self action:@selector(onClickOthers:)];
    [headerView addSubview:othersBtn];
    
    x = width * 3;
    rect = CGRectMake(x, y, width, height);
    UIButton *moreBtn = [UIButton optionButtonWithFrame:rect iconName:@"6" title:@"正在更新..."];
    [moreBtn addTarget:self action:@selector(onClickMore:)];
    [headerView addSubview:moreBtn];
    
    x = 0.f;
    y = 0.f;
    height = height * 2 + 140;
    width = SCREEN_WIDTH;
    rect = CGRectMake(x, y, width, height);
    headerView.frame = rect;
    
    x = 0.f;
    y = 0.f;
    width = SCREEN_WIDTH;
    height = SCREEN_HEIGHT;
    rect = CGRectMake(x, y, width, height);
    _mainInfoTableView = [[UITableView alloc]initWithFrame:rect];
    _mainInfoTableView.backgroundColor = [UIColor clearColor];
    _mainInfoTableView.delegate = self;
    _mainInfoTableView.dataSource = self;
    _mainInfoTableView.showsVerticalScrollIndicator = NO;
    _mainInfoTableView.tableHeaderView = headerView;
    [self.view addSubview:_mainInfoTableView];
    
    width = 60.f;
    height = 60.f;
    x = SCREEN_WIDTH - 20 - width;
    y = SCREEN_HEIGHT - 20 - height - 64.f;
    rect = CGRectMake(x, y, width, height);
    UIButton *createActiVityBtn = [[UIButton alloc] initWithFrame:rect];
    createActiVityBtn.alpha = 0.6;
    [createActiVityBtn setImageWithName:@"main_button"];
    [createActiVityBtn addTarget:self action:@selector(onClickCreateActivityBtn:)];
    [self.view insertSubview:createActiVityBtn aboveSubview:_mainInfoTableView];
    
}

- (void)onClickBook:(UIButton *)sender{
    T4_LOG_FUNC();
}

- (void)onClickClothes:(UIButton *)sender{
    T4_LOG_FUNC();
}

- (void)onClickLifeGoods:(UIButton *)sender{
    T4_LOG_FUNC();
}

- (void)onClickEleDevice:(UIButton *)sender{
    T4_LOG_FUNC();
}

- (void)onClickBike:(UIButton *)sender{
    T4_LOG_FUNC();
}

- (void)onClickPartTime:(UIButton *)sender{
    T4_LOG_FUNC();
}

- (void)onClickOthers:(UIButton *)sender{
    T4_LOG_FUNC();
}

- (void)onClickMore:(UIButton *)sender{
    T4_LOG_FUNC();
}

- (void)onClickSearch{
    [self showWithClassName:@"SearchViewController"];
}

- (void)onClickCreateActivityBtn:(UIButton *)sender{
    T4_LOG_FUNC();
    [self showWithClassName:@"PublishActivityViewController" mode:ControllerAppendModeNewNav bundle:nil];
    
}

#pragma mark ----------------UITableviewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 100;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44.f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                        reuseIdentifier:identifier];
    }

    cell.backgroundColor = [UIColor lightGrayColor];
    cell.alpha = 0.85;
    cell.textLabel.text = @"你好";
    return cell;
   
}

#pragma mark ----------------UITableviewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

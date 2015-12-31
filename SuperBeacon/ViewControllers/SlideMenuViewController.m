//
//  MenuViewController.m
//  SuperBeacon
//
//  Created by kys-2 on 15-3-30.
//  Copyright (c) 2015年 孙晓林. All rights reserved.
//

#import "SlideMenuViewController.h"
#import "PublicMethodManager.h"
#import "PKRevealController.h"
#import "T4Marco.h"
#import "UIImageView+WebCache.h"
#import "UIButton+Utils.h"
#import "UILabel+Utils.h"
#import "NINetworkImageView.h"
#import "UIButton+SlideMenuButton.h"
#import "UITableViewCell+Utils.h"
#import "SlideMenuTableViewCell.h"
#import "T4Bundle.h"
#import "MarketViewController.h"
#import "StoreViewController.h"
#import "InfoViewController.h"
#import "ShopCartViewController.h"
#import "RecordsViewController.h"
#import "SettingViewController.h"
#import "LoginViewController.h"
#import "UserDetailViewController.h"
#import "UserManager.h"


@interface SlideMenuViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *menuTableView;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet NINetworkImageView *roundImageView;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIButton *userPhotoBtn;
@property (weak, nonatomic) IBOutlet NINetworkImageView *vipLogoImage;
@property (weak, nonatomic) IBOutlet UIButton *vipBtn;
@property (weak, nonatomic) IBOutlet UILabel *creditValue;

@end

@implementation SlideMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _backgroundImageView.image = [[PublicMethodManager sharedInstance] blurryImage:[UIImage imageNamed:@"background"] withBlurLevel:kBlurLevel];
    
    [_roundImageView.layer setCornerRadius:CGRectGetHeight(_roundImageView.frame) / 2];
    [_roundImageView.layer masksToBounds];
     _roundImageView.clipsToBounds = YES;
    _roundImageView.initialImage = [UIImage imageNamed:@"icon_person_default"];
    [_userPhotoBtn.layer setCornerRadius:CGRectGetHeight(_userPhotoBtn.frame) / 2];
    [_userPhotoBtn.layer masksToBounds];
    _userPhotoBtn.clipsToBounds = YES;
    [_userPhotoBtn addTarget:self action:@selector(onClickUserPhotoBtn:)];
    
    _vipLogoImage.initialImage = [UIImage imageNamed:@"vip_logo"];
   // [_vipLogoImage setPathToNetworkImage:<#(NSString *)#>] 便于动态更换vipLogo
    [_vipBtn addTarget:self action:@selector(onClickVipBtn:)];
    
    _creditValue.backgroundColor = HEXCOLOR(0x65adff);
    _creditValue.alpha = 0.8;
    [_creditValue.layer setCornerRadius:2.f];
    [_creditValue.layer setMasksToBounds:YES];
    [_creditValue adjustsFontSizeToFitWidth];
    
    _loginBtn.enabled = NO;
    [_loginBtn.titleLabel adjustsFontSizeToFitWidth];
    [_loginBtn addTarget:self action:@selector(onClickLoginBtn:)];
    
    _menuTableView.delegate = self;
    _menuTableView.dataSource = self;
    _menuTableView.opaque = NO;
    _menuTableView.backgroundColor = [UIColor clearColor];
    _menuTableView.separatorStyle = NO;
    _menuTableView.bounces = NO;
    [self.revealController setMinimumWidth:240 maximumWidth:260 forViewController:self];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [_roundImageView setPathToNetworkImage:[UserManager sharedInstance].avatarUrl];
    _vipLogoImage.hidden = [UserManager sharedInstance].isVip ? NO : YES;
    _vipBtn.hidden = [UserManager sharedInstance].isVip ? NO : YES;
    _creditValue.text = [NSString stringWithFormat:@"%ld", [UserManager sharedInstance].creditValue];
    if ([UserManager sharedInstance].isLogin) {
        _loginBtn.enabled = NO;
        [_loginBtn setTitle:[UserManager sharedInstance].nickName];
    }else{
        _loginBtn.enabled = YES;
        [_loginBtn setTitle:@"登录/注册"];
    }
    
    
}

- (void)onClickLoginBtn:(UIButton *)sender{
    T4_LOG_FUNC();
    LoginViewController *loginViewController = [[LoginViewController alloc]init];
    UINavigationController *frontNav = [[UINavigationController alloc]initWithRootViewController:loginViewController];
    [self.revealController setFrontViewController:frontNav];
    [self.revealController showViewController:self.revealController.frontViewController];
}

- (void)onClickVipBtn:(UIButton *)sender{
    T4_LOG_FUNC();
}

- (void)onClickUserPhotoBtn:(UIButton *)sender{
    T4_LOG_FUNC();
    UINavigationController *frontNav;
    if ([[UserManager sharedInstance] isLogin]) {
        UserDetailViewController *userDetailView = [[UserDetailViewController alloc]init];
        frontNav = [[UINavigationController alloc]initWithRootViewController:userDetailView];

    }else{
         LoginViewController *loginViewController = [[LoginViewController alloc]init];
        frontNav = [[UINavigationController alloc]initWithRootViewController:loginViewController];
    }
    [self.revealController setFrontViewController:frontNav];
    [self.revealController showViewController:self.revealController.frontViewController];
}

#pragma mark - UITableView Delegate

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = HEXCOLOR(0xebebf3);
    cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:19];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)sectionIndex
{
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    NSArray *titles = @[@"卖讯", @"店铺", @"消息", @"购物车", @"明细", @"设置"];
    NSArray *images = @[@"sidebar_find", @"sidebar_mine", @"sidebar_language", @"slidebar_shopcart", @"setting_records", @"slidebar_setting"];
    SlideMenuTableViewCell *tableViewCell;
    T4Bundle *bundle = [T4Bundle createBundle];
    [bundle putObject:titles[indexPath.row ] forKey:@"slideCell"];
    tableViewCell = (SlideMenuTableViewCell *)[UITableViewCell tableView:tableView
                                                       cellWithNibName:@"SlideMenuTableViewCell"
                                                            withBundle:bundle];
    tableViewCell.logoImageView.image = [UIImage imageNamed:images[indexPath.row]];
    CGSize imageSize = CGSizeMake(19, 19);
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, UIScreen.mainScreen.scale);
    CGRect imageRect = CGRectMake(0.0, 0.0, imageSize.width, imageSize.height);
    [tableViewCell.logoImageView.image drawInRect:imageRect];
    tableViewCell.logoImageView.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIView *selectedBackground = [UIView new];
    selectedBackground.alpha = 0.2;
    selectedBackground.backgroundColor = [UIColor clearColor];
    [tableViewCell setSelectedBackgroundView:selectedBackground];
    
    return tableViewCell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UINavigationController *front;
    switch (indexPath.row) {
        case 0:{
            MarketViewController *marketViewController = [[MarketViewController alloc]init];
            front = [[UINavigationController alloc] initWithRootViewController:marketViewController];

        }
            break;
        case 1:{
            StoreViewController *storeViewController = [[StoreViewController alloc]init];
            front = [[UINavigationController alloc] initWithRootViewController:storeViewController];
        }
            break;
        case 2:{
            InfoViewController *infoViewController = [[InfoViewController alloc]init];
            front = [[UINavigationController alloc] initWithRootViewController:infoViewController];
        }
            break;
        case 3:{
            ShopCartViewController *shopCartViewController = [[ShopCartViewController alloc]init];
            front = [[UINavigationController alloc] initWithRootViewController:shopCartViewController];
        }
            break;
        case 4:{
            RecordsViewController *recordsViewController = [[RecordsViewController alloc]init];
            front = [[UINavigationController alloc] initWithRootViewController:recordsViewController];
        }
            break;
        case 5:{
            SettingViewController *settingViewController = [[SettingViewController alloc]init];
            front = [[UINavigationController alloc] initWithRootViewController:settingViewController];
        }
            break;
            
        default:
            break;
    }
    [self.revealController setFrontViewController:front];
    [self.revealController showViewController:self.revealController.frontViewController];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

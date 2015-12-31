//
//  UserDetailViewController.m
//  SuperBeacon
//
//  Created by kys－1 on 15-5-1.
//  Copyright (c) 2015年 孙晓林. All rights reserved.
//

#import "UserDetailViewController.h"
#import "NINetworkImageView.h"
#import "PublicMethodManager.h"
#import "UIScrollView+VGParallaxHeader.h"
#import "UIButton+Utils.h"
#import "UILabel+Utils.h"
#import "ChoosePhotoPresenter.h"
#import "UserDetailTableViewCell.h"
#import "ChooseAddressPresenter.h"
#import "RequestChangeAvatar.h"
#import "ResponseChangeAvatar.h"
#import "RequestChangeAddress.h"
#import "Header.h"
#import "BusinessManager.h"
#import "UserManager.h"
#import "uiView+Toast.h"
#import "UIImage+Utils.h"

@interface UserDetailViewController ()<UITableViewDelegate, UITableViewDataSource, ChoosePhotoDelegate, ChooseAddressDelegate>{
    ChoosePhotoPresenter *_choosePhotoPresenter;
    ChooseAddressPresenter *_chooseAddressPresenter;
    NSArray *_optionsArray;
    NSArray *_dataArray;
}
@property (strong, nonatomic)  NINetworkImageView *topBackgroundImageView;
@property (strong, nonatomic)  NINetworkImageView *avatarImageView;
@property (strong, nonatomic)  UIButton *avatarBtn;
@property (strong, nonatomic)  UILabel *nickNameLabel;
@property (strong, nonatomic)  NSString *addressString;
@property (weak, nonatomic)  IBOutlet UITableView *userInfoTableView;

@end

@implementation UserDetailViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setLeftNavButtonType:NavButtonMenu];
    self.view.backgroundColor = HEXCOLOR(0xFAFAFA);
    
    _choosePhotoPresenter = [[ChoosePhotoPresenter alloc] init];
    _choosePhotoPresenter.viewController = self;
    _choosePhotoPresenter.delegate = self;
    _choosePhotoPresenter.needCrop = YES;
    
    _chooseAddressPresenter = [[ChooseAddressPresenter alloc] init];
    _chooseAddressPresenter.viewController = self;
    _chooseAddressPresenter.delegate = self;
    
    CGFloat x = 0.f;
    CGFloat y = 0.f;
    CGFloat width = SCREEN_WIDTH;
    CGFloat height = 230.f;
    CGRect rect = CGRectMake(x, y, width, height);
    _topBackgroundImageView = [[NINetworkImageView alloc]initWithFrame:rect];
    UIImage *blurImage = [UIImage imageWithData:[UserManager sharedInstance].blurImage];
    if (blurImage) {
        _topBackgroundImageView.initialImage = [[PublicMethodManager sharedInstance] blurryImage:blurImage withBlurLevel:kBlurLevel * 4];
    }else{
    _topBackgroundImageView.initialImage = [[PublicMethodManager sharedInstance] blurryImage:[UIImage imageNamed:@"UserDetail"] withBlurLevel:kBlurLevel * 4];
    }
    
    width = 80.f;
    height = 80.f;
    x = (SCREEN_WIDTH - width) / 2.f;
    y = 80.f;
    rect = CGRectMake(x, y, width, height);
    _avatarImageView = [[NINetworkImageView alloc]initWithFrame:rect];
    [_avatarImageView.layer setCornerRadius:CGRectGetWidth(_avatarImageView.frame) / 2.0];
    [_avatarImageView.layer setBorderWidth:4.f];
    [_avatarImageView.layer setBorderColor:HEXCOLOR(0xF5F5F5).CGColor];
    _avatarImageView.clipsToBounds = YES;
    _avatarImageView.initialImage = [UIImage imageNamed:@"icon_person_default"];
    [_avatarImageView setPathToNetworkImage:[UserManager sharedInstance].avatarUrl];
    [_topBackgroundImageView addSubview:_avatarImageView];
    
    
    _avatarBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _avatarBtn.frame = rect;
    [_avatarBtn.layer setCornerRadius:CGRectGetWidth(_avatarBtn.frame) / 2.0];
    _avatarBtn.clipsToBounds = YES;
    [_avatarBtn setTitle:@""];
    [_avatarBtn addTarget:self action:@selector(onClickAvatarBtn:)];
    [_userInfoTableView insertSubview:_avatarBtn aboveSubview:_avatarImageView];
    
    width = 100.f;
    x = (SCREEN_WIDTH - width) / 2.0;
    y = CGRectGetMaxY(_avatarImageView.frame) + 12;
    height = 20.f;
    rect = CGRectMake(x, y, width, height);
    _nickNameLabel =[UILabel labelWithFrame:rect
                                       font:[UIFont systemFontOfSize:16.f]
                              textAlignment:NSTextAlignmentCenter
                                  textColor:T4_COLOR_WHITE
                       highlightedTextColor:T4_COLOR_WHITE];
    _nickNameLabel.adjustsFontSizeToFitWidth = YES;
    [_topBackgroundImageView addSubview:_nickNameLabel];
    
    
    [_userInfoTableView setParallaxHeaderView:_topBackgroundImageView mode:VGParallaxHeaderModeTopFill height:CGRectGetHeight(_topBackgroundImageView.frame)];
    _userInfoTableView.delegate = self;
    _userInfoTableView.dataSource = self;
    _userInfoTableView.showsVerticalScrollIndicator = NO;
    _userInfoTableView.backgroundColor = [UIColor clearColor];
    _userInfoTableView.opaque = NO;
    _userInfoTableView.separatorStyle = NO;
    _optionsArray = @[@"昵称", @"信用度", @"会员",@"密码", @"地址"];
    _dataArray = @[@"myTeam", @"0", @"未开通", @"15369302871",@"●●●●●●", @"西校区1号宿舍楼1430"];
    _addressString = @"西校区1号宿舍楼1430";
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleLightContent;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor clearColor]] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    _nickNameLabel.text = [UserManager sharedInstance].nickName;
    [_userInfoTableView reloadData];
    /*[self.navigationController setNavigationBarHidden:LAUNCH_MAIN_CONTROLLER ? YES : NO animated:YES];*/
}

- (void)onClickAvatarBtn:(UIButton *)sender{
    T4_LOG_FUNC();
    [_choosePhotoPresenter showOptions];
}

#pragma mark -------UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return section == 0 ? 3 : 2;
}

- (CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44.f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return section == 0 ? 0.f : 15.f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UserDetailTableViewCell *tableViewCell;
//    T4Bundle *bundle = [T4Bundle createBundle];
//    [bundle putObject:indexPath.section == 0  ? _dataArray[indexPath.row] : _dataArray[indexPath.row + 3] forKey:@"UserDetailTableViewCell"];
    tableViewCell = (UserDetailTableViewCell *)[UITableViewCell tableView:tableView
                                                      cellWithNibName:@"UserDetailTableViewCell"
                                                           withBundle:nil];
    tableViewCell.textLabel.textColor = HEXCOLOR(0x333333);
    tableViewCell.textLabel.font = [UIFont systemFontOfSize:16.f];
    tableViewCell.textLabel.text = indexPath.section == 0 ? _optionsArray[indexPath.row] : _optionsArray[indexPath.row + 3];
    tableViewCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    [tableViewCell.layer setBorderColor:HEXCOLOR(0xD7D7D7).CGColor];
    [tableViewCell.layer setBorderWidth:0.5];
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            tableViewCell.contentLabel.text = [UserManager sharedInstance].nickName;
        }else if(indexPath.row == 1){
            tableViewCell.contentLabel.text = [NSString stringWithFormat:@"%ld",[UserManager sharedInstance].creditValue];
        }else{
            tableViewCell.contentLabel.text = [UserManager sharedInstance].isVip ? @"已开通" : @"未开通";
        }
    }else{
        if (indexPath.row == 0) {
            tableViewCell.contentLabel.text = @"●●●●●●";
        }else{
            tableViewCell.contentLabel.text = [UserManager sharedInstance].address;
        }
    }
    return tableViewCell;
}

#pragma mark ----------------UITableviewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if(indexPath.section == 0){
        if (indexPath.row == 0) {
            [self showWithClassName:@"ResetNicknameViewController" mode:ControllerAppendModeNewNav bundle:nil];
        }else if (indexPath.row == 1){
            [self showWithClassName:@"CreditValueViewController"];
        }else{
            [self showWithClassName:@"VipViewController"];
        }
    }else{
        if (indexPath.row == 0) {
            [self showWithClassName:@"ChangePaswordViewController" mode:ControllerAppendModeNewNav bundle:nil];
        }else{
            [_chooseAddressPresenter loadView];
        }
    }
}


#pragma mark -------UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView*)scrollView{

    [_userInfoTableView shouldPositionParallaxHeader];
}

#pragma mark - ChoosePhotoDelegate

- (void)choosePhotoDidFinished:(UIImage *)editedImage{
    if (editedImage) {
        _avatarImageView.image = editedImage;
        _topBackgroundImageView.image = [[PublicMethodManager sharedInstance] blurryImage:editedImage withBlurLevel:kBlurLevel * 4];
        [self.view makeToastActivity];
        RequestChangeAvatar *requestChangeAvatar = [[RequestChangeAvatar alloc] init];
        [requestChangeAvatar setAvatar:editedImage];
        requestChangeAvatar.mobile = [UserManager sharedInstance].mobile;
        [[BusinessManager sharedInstance] mutiplePost:requestChangeAvatar success:^(RequestBean *request, ResponseBean *response) {
            NSParameterAssert(T4_CHECK_CLASS(response, ResponseChangeAvatar));
            ResponseChangeAvatar *responseChangeAvatar = (ResponseChangeAvatar*) response;
            [[UserManager sharedInstance] setAvatarUrl:responseChangeAvatar.avatar_url];
            [[UserManager sharedInstance] getBlurImage:editedImage];
            [self.view hideToastActivity];
            [self.view makeToast:@"头像更新成功！"];
            [_userInfoTableView reloadData];
        } failure:^(RequestBean *request, NSInteger errorCode, NSString *message) {
            [self.view hideToastActivity];
            [self.view makeToast:[NSString stringWithFormat:@"%@",message]];
        }];

    }
}

#pragma mark - ChooseAddressDelegate
- (void)onClickAddressChoosed:(NSString *)address{
    if (address) {
        [self.view makeToastActivity];
        RequestChangeAddress *requestChangeAddress = [[RequestChangeAddress alloc]init];
        requestChangeAddress.mobile = [UserManager sharedInstance].mobile;
        requestChangeAddress.address = address;
        [[BusinessManager sharedInstance] mutiplePost:requestChangeAddress success:^(RequestBean *request, ResponseBean *response) {
            [[UserManager sharedInstance] setAddress:address];
            [self.view hideToastActivity];
            [self.view makeToast:@"地址修改成功!"];
            [_userInfoTableView reloadData];
        } failure:^(RequestBean *request, NSInteger errorCode, NSString *message) {
            [self.view hideToastActivity];
            [self.view makeToast:[NSString stringWithFormat:@"%@",message]];
        }];

    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

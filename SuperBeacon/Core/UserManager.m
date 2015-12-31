//
//  UserManager.m
//  EarthIOS
//
//  Created by Xiaohui on 15/3/20.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import "UserManager.h"
#import "ResponseLogin.h"

#define IsLogin @"IsLogin"
#define UserId @"Id"
#define Mobile @"Mobile"
#define Password @"Password"
#define Nick @"Nick"
#define IsVIP @"IsVIP"
#define AvatarUrl @"AvatarUrl"
#define CreditValue @"CreditValue"
#define Address @"Address"
#define BlurImage @"BlurImage"

//#define ModeIndex @"ModeIndex"
//#define VoiceIndex @"VoiceIndex"
//#define RongUserId @"RongUserId"
//#define Age @"Age"
//#define Sex @"Sex"
//#define VIPExpireAt @"VIPExpireAt"
//#define RingCount @"RingCount"
//#define FlowerCount @"FlowerCount"
//#define HeartCount @"HeartCount"
//#define RingPrice @"RingPrice"
//#define FlowerPrice @"FlowerPrice"
//#define HeartPrice @"HeartPrice"
//#define RingWithdrawPrice @"RingWithdrawPrice"
//#define FlowerWithdrawPrice @"FlowerWithdrawPrice"
//#define HeartWithdrawPrice @"HeartWithdrawPrice"
//#define VoiceUrl @"VoiceUrl"
//#define RongToken @"RongToken"
//#define Member1M @"Member1M"
//#define Member12M @"Member12M"
//#define Source @"Source"
//#define OpenId @"OpenId"
//#define QQToken @"QQToken"
//#define Expires @"Expires"
//#define Birth @"Birth"

@interface UserManager ()
{
    NSUserDefaults *_store;
//    BOOL _isLogin;
//    NSInteger _voiceIndex;
//    NSInteger _modeIndex;
//    NSInteger _userId; //用户id
//    NSString *_rongUserId;
//    NSInteger _source;
//    NSString *_mobile; //手机号
//    NSString *_nick; //用户昵称
//    NSInteger _age; //年龄
//    NSInteger _sex; //((0, u'未知',), (1, u'男'), (2, u'女'))
//    BOOL _isVip; //是否为VIP
//    NSDate *_vipExpireAt; //yyyy-mm-dd VIP用户过期日期
//    NSDate *_birth; //yyyy-mm-dd VIP用户过期日期
//    NSInteger _ringCount; //钻戒数量
//    NSInteger _flowerCount; //鲜花数量
//    NSInteger _heartCount; //红心数量
//    CGFloat _ringPrice; //钻戒价格
//    CGFloat _flowerPrice; //鲜花价格
//    CGFloat _heartPrice; //红心价格
//    CGFloat _ringWithdrawPrice; //钻戒提现价格
//    CGFloat _flowerWithdrawPrice; //鲜花提现价格
//    CGFloat _heartWithdrawPrice; //红心提现价格
//    NSString *_avatarUrl; //头像url地址
//    NSString *_voiceUrl; //声音url地址
//    NSString *_rongToken; //融云提供的token
//    NSInteger _member12m;
//    NSInteger _member1m;
}
@end

@implementation UserManager

SYNTHESIZE_SINGLETON_FOR_CLASS(UserManager)

- (id)init
{
    self = [super init];
    if (self) {
        _store = [NSUserDefaults standardUserDefaults];
        [self restore];
    }
    
    return self;
}

- (void)restore
{
    self.isLogin = [_store boolForKey:IsLogin];
    if (self.isLogin) {
        
        self.avatarUrl = [_store stringForKey:AvatarUrl];
        self.nickName = [_store stringForKey:Nick];
        self.mobile = [_store stringForKey:Mobile];
        self.password = [_store stringForKey:Password];
        self.isVip = [_store boolForKey:IsVIP];
        self.userId = [_store integerForKey:UserId];
        self.creditValue = [_store integerForKey:CreditValue];
        self.address = [_store stringForKey:Address];
        self.blurImage = [_store objectForKey:BlurImage];
        
//        self.voiceUrl = [_store stringForKey:VoiceUrl];
//        self.birth = [_store objectForKey:Birth];
//        self.rongUserId = [_store stringForKey:RongUserId];
//        self.rongToken = [_store stringForKey:RongToken];
//        self.flowerCount = [_store integerForKey:FlowerCount];
//        self.heartCount = [_store integerForKey:HeartCount];
//        self.ringCount = [_store integerForKey:RingCount];
//        self.ringPrice = [_store floatForKey:RingPrice];
//        self.flowerPrice = [_store floatForKey:FlowerPrice];
//        self.heartPrice = [_store floatForKey:HeartPrice];
//        self.withdrawRingPrice = [_store floatForKey:RingWithdrawPrice];
//        self.withdrawFlowerPrice = [_store floatForKey:FlowerWithdrawPrice];
//        self.withdrawHeartPrice = [_store floatForKey:HeartWithdrawPrice];
//        self.member1mPrice = [_store integerForKey:Member1M];
//        self.member12mPrice = [_store integerForKey:Member12M];
//        self.sex = [_store integerForKey:Sex];
//        self.age = [_store integerForKey:Age];
    }
}

- (void)save
{
    [_store setBool:self.isLogin forKey:IsLogin];
    [_store setInteger:self.userId forKey:UserId];
    [_store setObject:self.mobile forKey:Mobile];
    [_store setObject:self.password forKey:Password];
    [_store setObject:self.nickName forKey:Nick];
    [_store setBool:self.isVip forKey:IsVIP];
    [_store setObject:self.avatarUrl forKey:AvatarUrl];
    [_store setInteger:self.creditValue forKey:CreditValue];
    [_store setObject:self.address forKey:Address];
    
//    [_store setObject:self.voiceUrl forKey:VoiceUrl];
//    [_store setObject:self.rongToken forKey:RongToken];
//    [_store setInteger:self.member1mPrice forKey:Member1M];
//    [_store setInteger:self.member12mPrice forKey:Member12M];
}

- (void)setUserResponse:(ResponseUser *)response
{
    
    self.isLogin = YES;
    self.userId = response.user_id;
    self.nickName = response.nick;
    self.mobile = response.mobile;
    self.password = response.password;
    self.isVip = response.is_vip;
    self.avatarUrl = response.avatar_url;
    self.creditValue = response.credit_value ;//假设数据
    self.address = response.address;
    [self save];
    
    //self.rongToken = response.rongtoken;
//    self.voiceUrl = response.voice_url;
//    self.birth = response.birthday;
//    self.rongUserId= response.idencode_3party;
//    self.flowerCount = response.flower_count;
//    self.heartCount = response.heart_count;
//    self.ringCount = response.ring_count;
//    self.ringPrice = response.ring;
//    self.flowerPrice = response.flower;
//    self.heartPrice = response.heart;
//    self.withdrawRingPrice = response.withdraw_ring;
//    self.withdrawFlowerPrice = response.withdraw_flower;
//    self.withdrawHeartPrice = response.withdraw_heart;
//    self.member1mPrice = response.member_1m;
//    self.member12mPrice = response.member_12m;
//    self.sex = response.sex;
//    self.age = response.age;

}


- (void)setAvatarUrl:(NSString *)avatarUrl
{
    _avatarUrl = avatarUrl;
    [_store setObject:avatarUrl forKey:AvatarUrl];
}

- (void)setAddress:(NSString *)address
{
    _address = address;
    [_store setObject:address forKey:Address];
}

- (void)setNickName:(NSString *)nickName
{
    _nickName = nickName;
    [_store setObject:nickName forKey:Nick];
    
}

- (void)setPassword:(NSString *)password{
    _password = password;
    [_store setObject:password forKey:Password];
}

- (void)getBlurImage:(UIImage *)blurImage{
    _blurImage = UIImageJPEGRepresentation(blurImage, 0.8);
    [_store setObject:_blurImage forKey:BlurImage];
}

- (void)logout
{
    self.isLogin = NO;
    [_store setBool:self.isLogin forKey:IsLogin];
    [NSUserDefaults resetStandardUserDefaults];
}

@end

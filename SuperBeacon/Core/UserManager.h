//
//  UserManager.h
//  EarthIOS
//
//  Created by Xiaohui on 15/3/20.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Core.h"

@class ResponseUser;

@interface UserManager : NSObject

SYNTHESIZE_SINGLETON_FOR_HEADER(UserManager)

//@property (nonatomic, strong) NSString *rongToken;
//@property (nonatomic, strong) NSString *voiceUrl;
//@property (nonatomic, strong) NSDate *birth;
//@property (nonatomic, strong) NSString *rongUserId;//用于聊天的ID
//@property (nonatomic) NSInteger flowerCount;
//@property (nonatomic) NSInteger heartCount;
//@property (nonatomic) NSInteger ringCount;
//@property (nonatomic) float ringPrice;
//@property (nonatomic) float flowerPrice;
//@property (nonatomic) float heartPrice;
//@property (nonatomic) float withdrawRingPrice;
//@property (nonatomic) float withdrawFlowerPrice;
//@property (nonatomic) float withdrawHeartPrice;
//@property (nonatomic) NSInteger member1mPrice;
//@property (nonatomic) NSInteger member12mPrice;
//@property (nonatomic) NSInteger sex;
//@property (nonatomic) NSInteger age;
//@property (nonatomic, strong) NSArray *users;

@property (nonatomic) NSInteger userId;
@property (nonatomic, strong) NSString *nickName;
@property (nonatomic, strong) NSString *mobile;
@property (nonatomic, strong) NSString *password;
@property (nonatomic) BOOL isVip;
@property (nonatomic) NSInteger creditValue;
@property (nonatomic, strong) NSString *avatarUrl;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSData *blurImage;

@property (nonatomic) BOOL isLogin;



//- (BOOL)isLogin;
- (void)logout;
- (void)setUserResponse:(ResponseUser *)response;
- (void)getBlurImage:(UIImage *)blurImage;
@end

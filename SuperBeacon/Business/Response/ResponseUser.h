//
//  ResponseUser.h
//  EarthIOS
//
//  Created by Xiaohui on 15/4/20.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import "ResponseBean.h"

@interface ResponseUser : ResponseBean

@property (nonatomic, readonly) NSInteger user_id; //用户id
@property (nonatomic, readonly, strong) NSString *mobile; //手机号
@property (nonatomic, readonly, strong) NSString *password; //密码
@property (nonatomic, readonly, strong) NSString *nick; //用户昵称
@property (nonatomic, readonly) NSInteger is_vip; //是否为VIP
@property (nonatomic, readonly) NSInteger credit_value; //信用度值
@property (nonatomic, readonly, strong) NSString *avatar_url; //头像url地址
@property (nonatomic, readonly, strong) NSString *address; //详细地址

//@property (nonatomic, readonly) NSInteger member_12m;
//@property (nonatomic, readonly) NSInteger member_1m;


//@property (nonatomic, readonly) NSInteger source; //((0,u'手机注册'),(1,u'QQ'),(2,u'微信'),(3,u'微博'))
//@property (nonatomic, readonly) NSInteger age; //年龄
//@property (nonatomic, readonly) NSInteger sex; //((0, u'未知',), (1, u'男'), (2, u'女'))
//@property (nonatomic, readonly, strong) NSDate *last_login; //yyyy-mm-dd HH:ii:ss
//@property (nonatomic, readonly, strong) NSDate *birthday; //yyyy-mm-dd HH:ii:ss
//@property (nonatomic, readonly, strong) NSDate *vip_expire_at; //yyyy-mm-dd VIP用户过期日期
//@property (nonatomic, readonly, strong) NSString *latest_latitude; //最后提交的经度
//@property (nonatomic, readonly, strong) NSString *latest_longitude; //最后提交的纬度
//@property (nonatomic, readonly) NSInteger ring_count; //钻戒数量
//@property (nonatomic, readonly) NSInteger flower_count; //鲜花数量
//@property (nonatomic, readonly) NSInteger heart_count; //红心数量
//@property (nonatomic, readonly) float ring; //钻戒价格
//@property (nonatomic, readonly) float flower; //鲜花价格
//@property (nonatomic, readonly) float heart; //红心价格
//@property (nonatomic, readonly) float withdraw_ring; //钻戒提现价格
//@property (nonatomic, readonly) float withdraw_flower; //鲜花提现价格
//@property (nonatomic, readonly) float withdraw_heart; //红心提现价格
//@property (nonatomic, readonly) NSInteger wealth; //财富数量
//@property (nonatomic, readonly, strong) NSString *voice_url; //声音url地址
//@property (nonatomic, readonly, strong) NSString *token; //系统提供的token
//@property (nonatomic, readonly, strong) NSString *rongtoken; //融云提供的token
//@property (nonatomic, readonly, strong) NSString *extraltoken; //第三方提供的token
//@property (nonatomic, readonly, strong) NSString *idencode_3party; //第3方用户身份id


@end

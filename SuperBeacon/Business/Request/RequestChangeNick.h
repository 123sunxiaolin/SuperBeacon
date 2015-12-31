//
//  RequestChangeNick.h
//  EarthIOS
//
//  Created by kys－1 on 15-4-19.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import "RequestBean.h"

@interface RequestChangeNick : RequestBean
@property (nonatomic, strong) NSString *mobile;
@property (nonatomic, strong) NSString *nick;
@end

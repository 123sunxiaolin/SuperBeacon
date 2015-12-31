//
//  RequestChangeAvatar.h
//  EarthIOS
//
//  Created by kys－1 on 15-4-19.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import "RequestBean.h"

@interface RequestChangeAvatar : RequestBean
@property (nonatomic, strong)NSString *mobile;
- (void)setAvatar:(UIImage *)avatar;

@end

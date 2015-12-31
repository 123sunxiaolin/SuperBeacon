//
//  RequestAlbum.h
//  EarthIOS
//
//  Created by kys-2 on 15-3-21.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import "RequestBean.h"

@interface RequestAlbum : RequestBean

@property (nonatomic) NSInteger user_id;
@property (nonatomic) NSInteger page_num;//当前页数, default=1
@property (nonatomic) NSInteger count_perpage; //页数, default=100

@end

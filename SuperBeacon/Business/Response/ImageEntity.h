//
//  ImageEntity.h
//  EarthIOS
//
//  Created by kys-2 on 15-3-22.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import "core.h"

@interface ImageEntity : MantleBean

@property (nonatomic,readonly) NSInteger album_id; // 在系统中的图片id
@property (nonatomic,readonly, strong) NSString *thumb_url; // 缩略图地址
@property (nonatomic,readonly, strong) NSString *image_url; // 原图地址

@end

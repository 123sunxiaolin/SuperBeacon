//
//  RequestAddPhoto.m
//  EarthIOS
//
//  Created by kys-2 on 15-3-21.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import "RequestAddPhoto.h"
#import "ResponseAddPhoto.h"
#import "Path.h"
#import "NetworkClient.h"

@interface RequestAddPhoto ()
{
    NSData *_photoData;
}

@end

@implementation RequestAddPhoto

- (Class)responseClass
{
    return [ResponseAddPhoto class];
}

- (NSString *)path
{
    return AddPhoto;
}

- (BOOL)needToken
{
    return YES;
}

- (void)setPhoto:(UIImage *)image
{
    if (image) {
        _photoData = UIImageJPEGRepresentation(image, 1.0);
    } else {
        _photoData = nil;
    }
}

- (NSArray *)dataArray
{
    if (_photoData) {
        UploadFileInfo *fileInfo = [[UploadFileInfo alloc] init];
        fileInfo.fileName = @"photo";
        fileInfo.data = _photoData;
        fileInfo.mineType = @"image/*";
        return @[fileInfo];
    }
    
    return nil;
}

@end

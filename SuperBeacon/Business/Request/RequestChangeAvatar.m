//
//  RequestChangeAvatar.m
//  EarthIOS
//
//  Created by kys－1 on 15-4-19.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import "RequestChangeAvatar.h"
#import "ResponseChangeAvatar.h"
#import "NetworkClient.h"
#import "Path.h"

@interface RequestChangeAvatar ()
{
    NSData *_avatarData;
}
@end

@implementation RequestChangeAvatar

- (Class)responseClass
{
    return [ResponseChangeAvatar class];
}

- (NSString *)path
{
    return ChangeAvatar;
}

- (void)setAvatar:(UIImage *)avatar
{
    if (avatar) {
        _avatarData = UIImageJPEGRepresentation(avatar, 0.5);
    } else {
        _avatarData = nil;
    }
}

- (NSArray *)dataArray
{
    if (_avatarData) {
        UploadFileInfo *fileInfo = [[UploadFileInfo alloc] init];
        fileInfo.fileName = @"photo";
        fileInfo.data = _avatarData;
        fileInfo.mineType = @"image/*";
        return @[fileInfo];
    }
    
    return nil;
}

@end

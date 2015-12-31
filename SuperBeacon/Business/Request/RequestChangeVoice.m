//
//  RequestChangeVoice.m
//  EarthIOS
//
//  Created by kys－1 on 15-4-19.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import "RequestChangeVoice.h"
#import "NetworkClient.h"
#import "AmrDataConverter.h"

@interface RequestChangeVoice ()
{
    NSData *_voiceData;
}

@end

@implementation RequestChangeVoice


- (void)setVoice:(NSString *)url
{
    if (url && url.length > 2) {
        NSData *data = [NSData dataWithContentsOfFile:url];
        _voiceData = [[AmrDataConverter shareAmrDataConverter] EncodeWAVEToAMR:data channel:1 nBitsPerSample:16];
        if (_voiceData && [[NSFileManager defaultManager] fileExistsAtPath:url]) {
            [[NSFileManager defaultManager] removeItemAtPath:url error:nil];
        }
    }
    
}

- (NSArray *)dataArray
{
    if (_voiceData) {
        UploadFileInfo *fileInfo = [[UploadFileInfo alloc] init];
        fileInfo.fileName = @"voice";
        fileInfo.data = _voiceData;
        fileInfo.mineType = @"data/*";
        return @[fileInfo];
    }
    
    return nil;
}


@end

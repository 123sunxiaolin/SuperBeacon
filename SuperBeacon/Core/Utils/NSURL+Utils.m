//
//  NSURL+Utils.m
//  EarthIOS
//
//  Created by Darren Yau on 22/4/15.
//  Copyright (c) 2015 Duno Tech. All rights reserved.
//

#import "NSURL+Utils.h"
#import "NSString+Utils.h"
//#import "AmrDataConverter.h"


@implementation NSURL (Utils)

//+(NSURL *)saveAmr_WavVoice2LocalPathWithUrlString:(NSString *)url;
//{
//    if (url && url.length > 2) {
//        NSString *fileName = [[url componentsSeparatedByString:@"/"] lastObject];
//        fileName = [fileName stringByReplacingOccurrencesOfString:@"amr" withString:@"wav"];
//        NSString *voiceDirPath = [NSString cacheVoicePath];
//        NSString *filePath = [NSString stringWithFormat:@"%@%@", voiceDirPath, fileName];
//        NSFileManager *fileManager = [NSFileManager defaultManager];
//        if (![fileManager fileExistsAtPath:filePath]) {
//            NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
//            if (data) {
//                data = [[AmrDataConverter shareAmrDataConverter] DecodeAMRToWAVE:data];
//                [fileManager createDirectoryAtPath:voiceDirPath withIntermediateDirectories:YES attributes:nil error:nil];
//                [data writeToFile:filePath atomically:YES];
//            }
//        }
//        return [NSURL URLWithString:filePath];
//    }
//    
//    return nil;
//}

@end

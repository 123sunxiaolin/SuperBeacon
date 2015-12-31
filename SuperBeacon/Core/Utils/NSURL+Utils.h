//
//  NSURL+Utils.h
//  EarthIOS
//
//  Created by Darren Yau on 22/4/15.
//  Copyright (c) 2015 Duno Tech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (Utils)

// 保存amr转换wav后的文件到本地，返回本地路径
+(NSURL *)saveAmr_WavVoice2LocalPathWithUrlString:(NSString *)url;

@end

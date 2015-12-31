//
//  RequestComplaint.m
//  EarthIOS
//
//  Created by Darren Yau on 21/4/15.
//  Copyright (c) 2015 Duno Tech. All rights reserved.
//

#import "RequestComplaint.h"
#import "ResponseComplaint.h"
#import "Path.h"
#import "NetworkClient.h"

@interface RequestComplaint ()
{
    NSArray *_imagesArr;
}

@end

@implementation RequestComplaint

- (Class)responseClass
{
    return [ResponseComplaint class];
}

- (NSString *)path
{
    return ActionComplaint;
}

- (BOOL)needToken
{
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{@"complaintContent":@"desctription", @"action_id":@"action_id"};
}

- (void)uploadFiles:(NSArray *)imagesArr
{
    _imagesArr = imagesArr;
}

- (NSArray *)dataArray
{
    if (_imagesArr && [_imagesArr count] > 0) {
        NSMutableArray *arr = [[NSMutableArray alloc] initWithCapacity:0];
        for (UIImage *image in _imagesArr) {
            UploadFileInfo *fileInfo = [[UploadFileInfo alloc] init];
            fileInfo.fileName = @"photo";
            fileInfo.data = UIImageJPEGRepresentation(image, 1.0);
            fileInfo.mineType = @"image/*";
            
            [arr addObject:fileInfo];
        }
        
        
        return arr;
    }
    
    return nil;
}



@end

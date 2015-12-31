//
//  RequestComplaint.h
//  EarthIOS
//
//  Created by Darren Yau on 21/4/15.
//  Copyright (c) 2015 Duno Tech. All rights reserved.
//

#import "RequestBean.h"

@interface RequestComplaint : RequestBean

@property (nonatomic, assign) NSInteger action_id;
@property (nonatomic, strong, readwrite) NSString *complaintContent;

- (void)uploadFiles:(NSArray *)imagesArr;

@end

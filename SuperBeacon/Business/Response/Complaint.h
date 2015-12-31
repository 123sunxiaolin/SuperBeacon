//
//  Complaint.h
//  EarthIOS
//
//  Created by Darren Yau on 21/4/15.
//  Copyright (c) 2015 Duno Tech. All rights reserved.
//

#import "MantleBean.h"

@interface Complaint : MantleBean

@property (nonatomic, readonly, assign) NSInteger comlainant_id;
@property (nonatomic, readonly, assign) NSInteger applier_int;
@property (nonatomic, readonly, strong) NSString *process_at;
@property (nonatomic, readonly, strong) NSString *process_result;
@property (nonatomic, readonly, assign) NSInteger process_status;
@property (nonatomic, readonly, strong) NSArray *attachment;
@property (nonatomic, readonly, strong) NSDate *create_at;

@end

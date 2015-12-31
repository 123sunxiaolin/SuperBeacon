//
//  ResponseActionDetail.m
//  EarthIOS
//
//  Created by 徐淮杰 on 15/3/21.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import "ResponseActionDetail.h"
#import "Person.h"
#import "Complaint.h"
@implementation ResponseActionDetail
MTL_OBJECT_TRANSFORMER(participate_users, Person)
MTL_OBJECT_TRANSFORMER(complaint, Complaint)
@end

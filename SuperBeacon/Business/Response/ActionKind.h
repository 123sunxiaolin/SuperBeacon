//
//  ActionKind.h
//  EarthIOS
//
//  Created by Darren Yau on 19/4/15.
//  Copyright (c) 2015 Duno Tech. All rights reserved.
//

#import "MantleBean.h"

@interface ActionKind : MantleBean

@property (nonatomic, readonly, assign) NSInteger id;
@property (nonatomic, readonly, strong) NSString *name;

@end

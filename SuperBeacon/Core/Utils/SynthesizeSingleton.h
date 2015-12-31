//
//  SynthesizeSingleton.h
//  Here
//
//  Created by Xiaohui Chen on 13-7-25.
//  Copyright (c) 2013年 Team4.us. All rights reserved.
//

#define SYNTHESIZE_SINGLETON_FOR_HEADER(className) \
\
+ (className *)sharedInstance;


#define SYNTHESIZE_SINGLETON_FOR_CLASS(classname) \
\
+ (classname *)sharedInstance \
{ \
    static classname *shared##classname = nil;\
    static dispatch_once_t onceToken;\
    dispatch_once(&onceToken, ^{ \
        shared##classname = [[self alloc] init]; \
    }); \
    return shared##classname; \
}

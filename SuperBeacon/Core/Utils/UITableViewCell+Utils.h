//
//  UITableViewCell+Utils.h
//  Here
//
//  Created by Xiaohui Chen on 13-7-25.
//  Copyright (c) 2013年 Team4.us. All rights reserved.
//

#import <UIKit/UIKit.h>

@class T4Bundle;

@interface UITableViewCell (Utils)

- (void)setViewWithBundle:(T4Bundle *)bundle;

+ (UITableViewCell *)tableView:(UITableView *)tableView
                 cellWithClass:(Class)c
                    withBundle:(T4Bundle *)bundle;

+ (UITableViewCell *)tableView:(UITableView *)tableView
               cellWithNibName:(NSString *)nibName
                    withBundle:(T4Bundle *)bundle;

@end

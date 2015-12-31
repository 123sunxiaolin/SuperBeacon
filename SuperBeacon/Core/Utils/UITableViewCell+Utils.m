//
//  UITableViewCell+Utils.m
//  Here
//
//  Created by Xiaohui Chen on 13-7-25.
//  Copyright (c) 2013年 Team4.us. All rights reserved.
//

#import "UITableViewCell+Utils.h"

@implementation UITableViewCell (Utils)

- (void)setViewWithBundle:(T4Bundle *)bundle
{
    
}

+ (UITableViewCell *)tableView:(UITableView *)tableView
                 cellWithClass:(Class)c
                    withBundle:(T4Bundle *)bundle
{
    NSString *identifier = NSStringFromClass(c);
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[c alloc] initWithStyle:UITableViewCellStyleSubtitle
                         reuseIdentifier:identifier];
    }
    
    [cell setViewWithBundle:bundle];
    
    return cell;
}

+ (UITableViewCell *)tableView:(UITableView *)tableView
               cellWithNibName:(NSString *)nibName
                    withBundle:(T4Bundle *)bundle
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:nibName];
    if (cell == nil) {
        NSArray* nibView = [[NSBundle mainBundle] loadNibNamed:nibName
                                                         owner:self
                                                       options:nil];
        cell = [nibView objectAtIndex:0];
    }
    
    [cell setViewWithBundle:bundle];
    
    return cell;
}

@end

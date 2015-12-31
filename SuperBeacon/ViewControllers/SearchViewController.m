//
//  SearchViewController.m
//  SuperBeacon
//
//  Created by kys－1 on 15-4-25.
//  Copyright (c) 2015年 孙晓林. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController () 
@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"搜索";
    [self setLeftNavButtonType:NavButtonBack];
    self.view.backgroundColor = [UIColor orangeColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

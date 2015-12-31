//
//  UserDetailTableViewCell.m
//  SuperBeacon
//
//  Created by kys－1 on 15-5-2.
//  Copyright (c) 2015年 孙晓林. All rights reserved.
//

#import "UserDetailTableViewCell.h"
#import "UITableViewCell+Utils.h"
#import "T4Bundle.h"
#import "T4Marco.h"

@interface UserDetailTableViewCell()


@end
@implementation UserDetailTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setViewWithBundle:(T4Bundle *)bundle
{
    _contentLabel.textColor = HEXCOLOR(0x999999);
    _contentLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:16];
    
//    NSObject *object = [bundle objectForKey:@"UserDetailTableViewCell"];
//    if (T4_CHECK_CLASS(object, NSString)) {
//       _contentLabel.text = (NSString *)object;
//    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

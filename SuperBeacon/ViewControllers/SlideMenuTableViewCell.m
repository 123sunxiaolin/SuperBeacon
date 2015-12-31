//
//  SlideMenuTableViewCell.m
//  SuperBeacon
//
//  Created by kys－1 on 15-4-24.
//  Copyright (c) 2015年 孙晓林. All rights reserved.
//

#import "SlideMenuTableViewCell.h"
#import "T4Marco.h"
#import "T4Bundle.h"
@interface SlideMenuTableViewCell()


@property (weak, nonatomic) IBOutlet UILabel *optionLabel;

@end
@implementation SlideMenuTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setViewWithBundle:(T4Bundle *)bundle
{
    _optionLabel.textColor = HEXCOLOR(0xebebf3);
    _optionLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:19];
    
    NSObject *object = [bundle objectForKey:@"slideCell"];
    if (T4_CHECK_CLASS(object, NSString)) {
        _optionLabel.text = (NSString *)object;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

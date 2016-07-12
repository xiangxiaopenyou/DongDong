//
//  SetDefaultAddressCell.m
//  DongDong
//
//  Created by 项小盆友 on 16/7/8.
//  Copyright © 2016年 项小盆友. All rights reserved.
//

#import "SetDefaultAddressCell.h"

@implementation SetDefaultAddressCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.defaultSwitch.transform = CGAffineTransformMakeScale(0.75, 0.75);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

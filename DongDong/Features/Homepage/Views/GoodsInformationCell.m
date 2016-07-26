//
//  GoodsInformationCell.m
//  DongDong
//
//  Created by 项小盆友 on 16/7/22.
//  Copyright © 2016年 项小盆友. All rights reserved.
//

#import "GoodsInformationCell.h"

@implementation GoodsInformationCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.freeDeliveryButton.layer.masksToBounds = YES;
    self.freeDeliveryButton.layer.cornerRadius = 2.0;
    self.freeDeliveryButton.layer.borderWidth = 0.5;
    self.freeDeliveryButton.layer.borderColor = kHexRGBColorWithAlpha(0xff6138, 1.0).CGColor;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

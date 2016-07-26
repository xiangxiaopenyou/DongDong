//
//  GoodsEvaluationCell.m
//  DongDong
//
//  Created by 项小盆友 on 16/7/22.
//  Copyright © 2016年 项小盆友. All rights reserved.
//

#import "GoodsEvaluationCell.h"

@implementation GoodsEvaluationCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.lookOverAllEvaluationsButton.layer.masksToBounds = YES;
    self.lookOverAllEvaluationsButton.layer.cornerRadius = 2.0;
    self.lookOverAllEvaluationsButton.layer.borderWidth = 0.5;
    self.lookOverAllEvaluationsButton.layer.borderColor = kHexRGBColorWithAlpha(0xbcbcbc, 1.0).CGColor;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)lookOverAllClick:(id)sender {
}

@end

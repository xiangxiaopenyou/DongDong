//
//  MessageCell.m
//  DongDong
//
//  Created by 项小盆友 on 16/7/4.
//  Copyright © 2016年 项小盆友. All rights reserved.
//

#import "MessageCell.h"
#import <UIImageView+AFNetworking.h>
#import "Util.h"
#import "CommonsDefines.h"

@implementation MessageCell
- (void)setupContentWith:(MessageModel *)model {
    [self.sectionButton setBackgroundImage:[Util imageWithColor:kRGBColor(186, 186, 186, 1.0)] forState:UIControlStateHighlighted];
    self.messageLabel.text = model.messageContent;
    self.timeLabel.text = model.messageDateString;
    [self.goodsImageView setImageWithURL:[NSURL URLWithString:model.messageImageUrlString] placeholderImage:nil];
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)sectionButtonClick:(id)sender {
    
}

@end

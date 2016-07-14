//
//  DeliveryAddressCell.m
//  DongDong
//
//  Created by 项小盆友 on 16/7/5.
//  Copyright © 2016年 项小盆友. All rights reserved.
//

#import "DeliveryAddressCell.h"

@implementation DeliveryAddressCell
- (void)initModel:(AddressModel *)model {
    self.addressModel = model;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)enableButtonClick:(id)sender {
    UIButton *button = (UIButton *)sender;
    if (!button.selected) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(addressSetDefault:)]) {
            [self.delegate addressSetDefault:self.addressModel];
        }
    }
}
- (IBAction)editButtonClick:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(addressDidClickEdit:)]) {
        [self.delegate addressDidClickEdit:self.addressModel];
    }
}
- (IBAction)deleteButtonClick:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(addressDidClickDelete:)]) {
        [self.delegate addressDidClickDelete:self.addressModel];
    }
}

@end

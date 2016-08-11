//
//  ShoppingCartCell.m
//  DongDong
//
//  Created by 项小盆友 on 16/6/24.
//  Copyright © 2016年 项小盆友. All rights reserved.
//

#import "ShoppingCartCell.h"
@interface ShoppingCartCell()
@property (copy, nonatomic) selectBlock selectedBlock;
@property (copy, nonatomic) editQuantityBlock editBlock;
@end
@implementation ShoppingCartCell
- (void)setupContentWith:(CartGoodsModel *)model {
    self.goodsName.text = [NSString stringWithFormat:@"%@", model.goodsName];
    self.goodsSize.text = [NSString stringWithFormat:@"尺寸:%@", model.goodsSize];
    self.goodsColor.text = [NSString stringWithFormat:@"颜色:%@", model.goodsColor];
    self.goodsQuantity.text = [NSString stringWithFormat:@"x%@", model.goodsQuantity];
    self.goodsPrice.text = [NSString stringWithFormat:@"￥%@", XLStringFromFloat([model.goodsPrice floatValue])];
    [self.goodsImage setImageWithURL:XLURLFromString(model.goodsMainImageUrl) placeholderImage:nil];
    self.editQuantityLabel.text = [NSString stringWithFormat:@"%@", model.goodsQuantity];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)goodsSelect:(selectBlock)block {
    self.selectedBlock = block;
}
- (void)goodsQuantityEdit:(editQuantityBlock)block {
    self.editBlock = block;
}

- (IBAction)selectButtonClick:(id)sender {
    UIButton *button = (UIButton *)sender;
    if (button.selected) {
        button.selected = NO;
        if (self.selectedBlock) {
            self.selectedBlock(NO);
        }
    } else {
        button.selected = YES;
        if (self.selectedBlock) {
            self.selectedBlock(YES);
        }
    }
}
- (IBAction)quantityMinus:(id)sender {
    NSInteger quantityInt = [self.editQuantityLabel.text integerValue];
    if (quantityInt > 1) {
        self.editQuantityLabel.text = [NSString stringWithFormat:@"%@", @(quantityInt - 1)];
        self.goodsQuantity.text = [NSString stringWithFormat:@"x%@", @(quantityInt - 1)];
        if (self.editBlock) {
            self.editBlock(quantityInt - 1);
        }
    }
}
- (IBAction)quantityPlus:(id)sender {
    NSInteger quantityInt = [self.editQuantityLabel.text integerValue];
    self.editQuantityLabel.text = [NSString stringWithFormat:@"%@", @(quantityInt + 1)];
    self.goodsQuantity.text = [NSString stringWithFormat:@"x%@", @(quantityInt + 1)];
    if (self.editBlock) {
        self.editBlock(quantityInt + 1);
    }
}

@end

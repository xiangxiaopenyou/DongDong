//
//  OrderDetailCell.m
//  DongDong
//
//  Created by 项小盆友 on 16/7/27.
//  Copyright © 2016年 项小盆友. All rights reserved.
//

#import "OrderDetailCell.h"
#import "OrderGoodsModel.h"
#import "OrderGoodsView.h"
#import <Masonry.h>

@implementation OrderDetailCell

- (void)setupContentWith:(OrderModel *)model {
    self.orderNumberLabel.text = [NSString stringWithFormat:@"订单号:%@", model.orderNumber];
    self.orderStateLabel.text = @"已完成";
    self.goodsPriceLabel.text = [NSString stringWithFormat:@"￥%@", XLStringFromFloat([model.orderPrice floatValue])];
    self.freightLabel.text = [NSString stringWithFormat:@"￥%@", XLStringFromFloat([model.orderFreight floatValue])];
    CGFloat totalPrice = [model.orderPrice floatValue] + [model.orderFreight floatValue];
    self.totalPriceLabel.text = [NSString stringWithFormat:@"￥%@", XLStringFromFloat(totalPrice)];
    
    NSArray *goodsArray = [model.goodsArray copy];
    if (goodsArray.count > 0) {
        [self addGoods:goodsArray];
    }
    
}
- (void)addGoods:(NSArray *)array {
    for (NSInteger i = 0; i < array.count; i ++) {
        OrderGoodsModel *tempGoodsModel = array[i];
        OrderGoodsView *goodsView = [[NSBundle mainBundle] loadNibNamed:@"OrderGoodsView" owner:nil options:nil][0];
        [goodsView setContentWith:tempGoodsModel];
        [self.contentView addSubview:goodsView];
        [goodsView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left);
            make.right.equalTo(self.contentView.mas_right);
            make.top.equalTo(self.contentView.mas_top).with.offset(30.0 + 82.0 * i);
            make.height.mas_offset(79.0);
        }];
    }
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end

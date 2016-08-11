//
//  OrderGoodsView.m
//  DongDong
//
//  Created by 项小盆友 on 16/7/14.
//  Copyright © 2016年 项小盆友. All rights reserved.
//

#import "OrderGoodsView.h"

@implementation OrderGoodsView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)setContentWith:(OrderGoodsModel *)model {
    self.goodsNameLabel.text = [NSString stringWithFormat:@"%@", model.goodsName];
    self.goodsSizeLabel.text = [NSString stringWithFormat:@"尺寸:%@", model.goodsSize];
    self.goodsColorLabel.text = [NSString stringWithFormat:@"颜色:%@", model.goodsColor];
    self.goodsQuantityLabel.text = [NSString stringWithFormat:@"x%@", model.goodsQuantity];
    self.goodsPriceLabel.text = [NSString stringWithFormat:@"￥%@", XLStringFromFloat([model.goodsPrice floatValue])];
    [self.goodsImageView setImageWithURL:XLURLFromString(model.goodsMainImage) placeholderImage:nil];
}

@end

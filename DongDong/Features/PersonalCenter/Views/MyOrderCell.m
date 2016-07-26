//
//  MyOrderCell.m
//  DongDong
//
//  Created by 项小盆友 on 16/7/14.
//  Copyright © 2016年 项小盆友. All rights reserved.
//

#import "MyOrderCell.h"
#import "OrderGoodsModel.h"
#import "OrderGoodsView.h"

@implementation MyOrderCell

- (void)setupContentWith:(OrderModel *)model {
    self.orderNumberLabel.text = [NSString stringWithFormat:@"订单号:%@", model.orderNumber];
    NSString *price = [NSString stringWithFormat:@"￥%@", XLStringFromFloat([model.orderPrice floatValue])];
    NSString *priceString = [NSString stringWithFormat:@"合计:%@", price];
    NSMutableAttributedString *priceMutableString = [[NSMutableAttributedString alloc] initWithString:priceString];
    [priceMutableString addAttributes:@{NSFontAttributeName : kSystemFont(15)} range:NSMakeRange(3, price.length)];
    self.orderPriceLabel.attributedText = priceMutableString;
    self.orderGoodsQuantityLabel.text = [NSString stringWithFormat:@"共%@件商品", model.goodsQuantity];
    
    NSArray *goodsArray = [model.goodsArray copy];
    if (goodsArray.count > 0) {
        [self addGoods:goodsArray];
    }
    
}
- (void)addGoods:(NSArray *)array {
    for (NSInteger i = 0; i < array.count; i ++) {
        OrderGoodsModel *tempGoodsModel = array[i];
        OrderGoodsView *goodsView = [[NSBundle mainBundle] loadNibNamed:@"OrderGoodsView" owner:nil options:nil][0];
        goodsView.frame = CGRectMake(0, 30.0 + 82.0 * i, SCREEN_WIDTH, 79.0);
        [goodsView setContentWith:tempGoodsModel];
        [self.contentView addSubview:goodsView];
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.testButton.layer.masksToBounds = YES;
    self.testButton.layer.cornerRadius = 2.0;
    self.testButton.layer.borderWidth = 0.5;
    self.testButton.layer.borderColor = kHexRGBColorWithAlpha(0xff6138, 1.0).CGColor;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

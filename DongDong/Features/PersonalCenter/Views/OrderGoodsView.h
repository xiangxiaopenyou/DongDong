//
//  OrderGoodsView.h
//  DongDong
//
//  Created by 项小盆友 on 16/7/14.
//  Copyright © 2016年 项小盆友. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderGoodsModel.h"

@interface OrderGoodsView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *goodsImageView;
@property (weak, nonatomic) IBOutlet UILabel *goodsNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *goodsColorLabel;
@property (weak, nonatomic) IBOutlet UILabel *goodsSizeLabel;
@property (weak, nonatomic) IBOutlet UILabel *goodsPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *goodsQuantityLabel;

- (void)setContentWith:(OrderGoodsModel *)model;
@end

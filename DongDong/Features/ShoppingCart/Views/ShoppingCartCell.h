//
//  ShoppingCartCell.h
//  DongDong
//
//  Created by 项小盆友 on 16/6/24.
//  Copyright © 2016年 项小盆友. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CartGoodsModel.h"
typedef void (^selectBlock)(BOOL state);
typedef void (^editQuantityBlock)(NSInteger goodsQuantity);

@interface ShoppingCartCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *selectedButton;
@property (weak, nonatomic) IBOutlet UIImageView *goodsImage;
@property (weak, nonatomic) IBOutlet UILabel *goodsColor;
@property (weak, nonatomic) IBOutlet UILabel *goodsSize;
@property (weak, nonatomic) IBOutlet UILabel *goodsPrice;
@property (weak, nonatomic) IBOutlet UILabel *goodsQuantity;
@property (weak, nonatomic) IBOutlet UILabel *goodsName;
@property (weak, nonatomic) IBOutlet UIView *editQuantityView;
@property (weak, nonatomic) IBOutlet UILabel *editQuantityLabel;

- (void)setupContentWith:(CartGoodsModel *)model;
- (void)goodsSelect:(selectBlock)block;
- (void)goodsQuantityEdit:(editQuantityBlock)block;

@end

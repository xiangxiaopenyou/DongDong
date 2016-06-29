//
//  GoodsListCell.h
//  DongDong
//
//  Created by 项小盆友 on 16/6/20.
//  Copyright © 2016年 项小盆友. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GoodsModel.h"
typedef void (^clickGoodsBlock)(GoodsModel *model);

@interface GoodsListCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *leftView;
@property (weak, nonatomic) IBOutlet UIView *rightView;
@property (weak, nonatomic) IBOutlet UIImageView *leftImageView;
@property (weak, nonatomic) IBOutlet UILabel *leftGoodsName;
@property (weak, nonatomic) IBOutlet UILabel *leftGoodsPrice;
@property (weak, nonatomic) IBOutlet UIImageView *rightImageView;
@property (weak, nonatomic) IBOutlet UILabel *rightGoodsName;
@property (weak, nonatomic) IBOutlet UILabel *rightGoodsPrice;

@property (copy, nonatomic) clickGoodsBlock goodsBlock;

- (void)setupContentWith:(GoodsModel *)leftModel rightModel:(GoodsModel *)rightModel;
- (void)goodsClickBlock:(clickGoodsBlock)block;
@end

//
//  GoodsListCell.m
//  DongDong
//
//  Created by 项小盆友 on 16/6/20.
//  Copyright © 2016年 项小盆友. All rights reserved.
//

#import "GoodsListCell.h"

@interface GoodsListCell()
@property (strong, nonatomic) GoodsModel *tempLeftModel;
@property (strong, nonatomic) GoodsModel *tempRightModel;
@end

@implementation GoodsListCell
- (void)setupContentWith:(GoodsModel *)leftModel rightModel:(GoodsModel *)rightModel {
    self.tempLeftModel = [leftModel copy];
    [self.leftImageView setImageWithURL:XLURLFromString(leftModel.mainImageUrl) placeholderImage:nil];
    self.leftGoodsName.text = [NSString stringWithFormat:@"%@", leftModel.goodsName];
    self.leftGoodsPrice.text = [NSString stringWithFormat:@"￥%@", XLStringFromFloat([leftModel.goodsPrice floatValue])];
    self.leftView.userInteractionEnabled = YES;
    [self.leftView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(leftViewRecognizer:)]];
    if (!rightModel) {
        self.rightView.hidden = YES;
        self.tempRightModel = nil;
    } else {
        self.tempRightModel = [rightModel copy];
        self.rightView.hidden = NO;
        [self.rightImageView setImageWithURL:XLURLFromString(rightModel.mainImageUrl)];
        self.rightGoodsName.text = [NSString stringWithFormat:@"%@", rightModel.goodsName];
        self.rightGoodsPrice.text = [NSString stringWithFormat:@"￥%@", XLStringFromFloat([rightModel.goodsPrice floatValue])];
        self.rightView.userInteractionEnabled = YES;
        [self.rightView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(rightViewRecogizer:)]];
    }
}
- (void)goodsClickBlock:(clickGoodsBlock)block {
    self.goodsBlock = block;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

#pragma mark - Action
- (void)leftViewRecognizer:(UITapGestureRecognizer *)gesture {
    if (self.goodsBlock) {
        self.goodsBlock(self.tempLeftModel);
    }
}
- (void)rightViewRecogizer:(UITapGestureRecognizer *)gesture {
    if (self.goodsBlock) {
        self.goodsBlock(self.tempRightModel);
    }
}

@end

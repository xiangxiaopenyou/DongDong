//
//  MyOrderCell.h
//  DongDong
//
//  Created by 项小盆友 on 16/7/14.
//  Copyright © 2016年 项小盆友. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderModel.h"

@interface MyOrderCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *orderNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *orderStateLabel;
@property (weak, nonatomic) IBOutlet UILabel *orderGoodsQuantityLabel;
@property (weak, nonatomic) IBOutlet UILabel *orderPriceLabel;
@property (weak, nonatomic) IBOutlet UIButton *testButton;

- (void)setupContentWith:(OrderModel *)model;

@end

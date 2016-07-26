//
//  GoodsInformationCell.h
//  DongDong
//
//  Created by 项小盆友 on 16/7/22.
//  Copyright © 2016年 项小盆友. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GoodsInformationCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *goodsNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *goodsSalePriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *goodsOldPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *deletePriceLabel;
@property (weak, nonatomic) IBOutlet UIButton *freeDeliveryButton;

@end

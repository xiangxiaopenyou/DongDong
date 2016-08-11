//
//  OrderAddressCell.h
//  DongDong
//
//  Created by 项小盆友 on 16/7/27.
//  Copyright © 2016年 项小盆友. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderAddressCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *consigneeNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *orderAddressLabel;
@property (weak, nonatomic) IBOutlet UILabel *consigneePhoneLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightConstraintOfPhoneLabel;

@end

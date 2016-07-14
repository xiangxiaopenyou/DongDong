//
//  DeliveryAddressCell.h
//  DongDong
//
//  Created by 项小盆友 on 16/7/5.
//  Copyright © 2016年 项小盆友. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AddressModel;

@protocol DeliveryAddressCellDelegate <NSObject>
- (void)addressSetDefault:(AddressModel *)model;
- (void)addressDidClickEdit:(AddressModel *)model;
- (void)addressDidClickDelete:(AddressModel *)model;

@end

@interface DeliveryAddressCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;
@property (weak, nonatomic) IBOutlet UIButton *enableButton;

@property (strong, nonatomic) AddressModel *addressModel;

@property (weak, nonatomic) id<DeliveryAddressCellDelegate> delegate;

- (void)initModel:(AddressModel *)model;

@end

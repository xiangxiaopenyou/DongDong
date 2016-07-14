//
//  AddressModel.h
//  DongDong
//
//  Created by 项小盆友 on 16/7/8.
//  Copyright © 2016年 项小盆友. All rights reserved.
//

#import "BaseModel.h"

@interface AddressModel : BaseModel
@property (copy, nonatomic) NSString *addressId;
@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *phone;
@property (copy, nonatomic) NSString *areaAddress;
@property (copy, nonatomic) NSString *detailAddress;
@property (strong, nonatomic) NSNumber *isDefault;

@end

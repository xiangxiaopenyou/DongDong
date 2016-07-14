//
//  OrderModel.h
//  DongDong
//
//  Created by 项小盆友 on 16/7/13.
//  Copyright © 2016年 项小盆友. All rights reserved.
//

#import "BaseModel.h"

@interface OrderModel : BaseModel
@property (copy, nonatomic) NSString *orderId;
@property (copy, nonatomic) NSString *orderNumber;
@property (strong, nonatomic) NSNumber *goodsQuantity;
@property (strong, nonatomic) NSNumber *orderPrice;
@property (strong, nonatomic) NSNumber *orderState;
@property (copy, nonatomic) NSArray *goodsArray;

@end

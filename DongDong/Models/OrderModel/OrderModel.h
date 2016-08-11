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
@property (copy, nonatomic) NSString *orderNumber;    //订单号
@property (strong, nonatomic) NSNumber *goodsQuantity;//订单物品数量
@property (strong, nonatomic) NSNumber *orderPrice;   //订单物品总价
@property (strong, nonatomic) NSNumber *orderFreight; //运费
@property (strong, nonatomic) NSNumber *orderState;   //订单状态
@property (copy, nonatomic) NSString *consigneeName;  //收件人姓名
@property (copy, nonatomic) NSString *consigneePhone; //收件人电话
@property (strong, nonatomic) NSString *orderAddress; //收件地址
@property (copy, nonatomic) NSArray *goodsArray;

@end

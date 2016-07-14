//
//  OrderGoodsModel.h
//  DongDong
//
//  Created by 项小盆友 on 16/7/13.
//  Copyright © 2016年 项小盆友. All rights reserved.
//

#import "BaseModel.h"

@interface OrderGoodsModel : BaseModel
@property (copy, nonatomic) NSString *goodsId;
@property (copy, nonatomic) NSString *goodsMainImage;
@property (copy, nonatomic) NSString *goodsName;
@property (strong, nonatomic) NSNumber *goodsQuantity;
@property (copy, nonatomic) NSString *goodsColor;
@property (copy, nonatomic) NSString *goodsSize;
@property (strong, nonatomic) NSNumber *goodsPrice;

@end

//
//  CartGoodsModel.h
//  DongDong
//
//  Created by 项小盆友 on 16/6/24.
//  Copyright © 2016年 项小盆友. All rights reserved.
//

#import "BaseModel.h"

@interface CartGoodsModel : BaseModel
@property (copy, nonatomic) NSString *goodsName;
@property (copy, nonatomic) NSString *goodsMainImageUrl;
@property (copy, nonatomic) NSString *goodsColor;
@property (copy, nonatomic) NSString *goodsSize;
@property (strong, nonatomic) NSNumber *goodsQuantity;
@property (strong, nonatomic) NSNumber *goodsPrice;

@end

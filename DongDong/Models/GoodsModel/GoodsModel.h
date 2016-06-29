//
//  GoodsModel.h
//  DongDong
//
//  Created by 项小盆友 on 16/6/21.
//  Copyright © 2016年 项小盆友. All rights reserved.
//

#import "BaseModel.h"

@interface GoodsModel : BaseModel
@property (copy, nonatomic) NSString *mainImageUrl;
@property (copy, nonatomic) NSString *goodsName;
@property (strong, nonatomic) NSNumber *goodsPrice;

@end

//
//  GoodsModel.h
//  DongDong
//
//  Created by 项小盆友 on 16/6/21.
//  Copyright © 2016年 项小盆友. All rights reserved.
//

#import "BaseModel.h"

@interface GoodsModel : BaseModel
@property (copy, nonatomic) NSString *goodsId;
@property (copy, nonatomic) NSString *g_name;
@property (copy, nonatomic) NSString *g_number;
@property (strong, nonatomic) NSNumber *g_market_price; //原价
@property (strong, nonatomic) NSNumber *g_sales_price;  //折扣价
@property (strong, nonatomic) NSNumber *inventory;      //库存
@property (copy, nonatomic) NSString *g_content;        //介绍
@property (strong, nonatomic) NSNumber *sales_number;   //销量
@property (strong, nonatomic) NSNumber *brower_number;  //浏览量
@property (copy, nonatomic) NSString<Optional> *list_time;        //上架时间
@property (copy, nonatomic) NSString<Optional> *delist_time;  //下架时间
@property (copy, nonatomic) NSString *pic_url;          //首页图
@property (copy, nonatomic) NSString *logistics_mode;   //物流名称
@property (strong, nonatomic) NSNumber *logistics_price;//物流价格
@property (copy, nonatomic) NSString<Optional> *logistics_mode_id;
@property (copy, nonatomic) NSArray *sku_arr;
@property (copy, nonatomic) NSArray *img_arr;

+ (void)fetchGoodsList:(NSInteger)page handler:(RequestResultHandler)handler;

@end

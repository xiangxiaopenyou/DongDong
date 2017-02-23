//
//  GoodsModel.m
//  DongDong
//
//  Created by 项小盆友 on 16/6/21.
//  Copyright © 2016年 项小盆友. All rights reserved.
//

#import "GoodsModel.h"
#import "GoodsListRequest.h"
#import "ResultIndexModel.h"

@implementation GoodsModel
+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"id" : @"goodsId"}];
}
+ (void)fetchGoodsList:(NSInteger)page handler:(RequestResultHandler)handler {
    [[GoodsListRequest new] request:^BOOL(GoodsListRequest *request) {
        request.page = page;
        return YES;
    } result:^(id object, NSString *msg) {
        if (msg) {
            !handler ?: handler(nil, msg);
        } else {
            ResultIndexModel *tempModel = [[ResultIndexModel alloc] initWithResultDictionary:object modelKey:@"data" modelClass:[GoodsModel new]];
            !handler ?: handler(tempModel, nil);
        }
    }];
}
@end

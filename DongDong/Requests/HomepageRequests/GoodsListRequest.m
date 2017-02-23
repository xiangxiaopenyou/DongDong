//
//  GoodsListRequest.m
//  DongDong
//
//  Created by 项小盆友 on 16/8/15.
//  Copyright © 2016年 项小盆友. All rights reserved.
//

#import "GoodsListRequest.h"

@implementation GoodsListRequest
- (void)request:(ParamsBlock)paramsBlock result:(RequestResultHandler)resultHandler {
    if (!paramsBlock(self)) {
        return;
    }
    NSDictionary *param = @{@"page" : @(self.page),
                            @"pagesize" : @(20)};
    [[RequestManager sharedInstance] POST:GOODS_LIST parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if ([responseObject[@"state"] isEqual:@"1100"]) {
            !resultHandler ?: resultHandler(responseObject, nil);
        } else {
            !resultHandler ?: resultHandler(nil, responseObject[@"message"]);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        !resultHandler ?: resultHandler(nil, error.description);
    }];
}

@end

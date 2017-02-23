//
//  ResultIndexModel.m
//  DongDong
//
//  Created by 项小盆友 on 16/8/15.
//  Copyright © 2016年 项小盆友. All rights reserved.
//

#import "ResultIndexModel.h"
#import "BaseModel.h"

@implementation ResultIndexModel
- (instancetype)initWithResultDictionary:(NSDictionary *)dic modelKey:(NSString *)key modelClass:(BaseModel *)modelClass {
    self = [super init];
    if (self) {
        if ([dic[@"total"] integerValue]  >= 20) {
            _haveMore = YES;
        } else {
            _haveMore = NO;
        }
        id result = dic[key];
        if ([result isKindOfClass:[NSArray class]]) {
            _result = [[modelClass class] setupWithArray:result];
        } else if ([result isKindOfClass:[NSDictionary class]]) {
            _result = [[[modelClass class] alloc] initWithDictionary:result error:nil];
        }
    }
    return self;
}

@end

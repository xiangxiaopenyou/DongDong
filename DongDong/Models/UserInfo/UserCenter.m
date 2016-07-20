//
//  UserCenter.m
//  DongDong
//
//  Created by 项小盆友 on 16/7/15.
//  Copyright © 2016年 项小盆友. All rights reserved.
//

#import "UserCenter.h"

@implementation UserCenter
+ (UserCenter *)shareCenter {
    static UserCenter *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!instance) {
            instance = [[self alloc] init];
        }
    });
    return instance;
}
- (BOOL)isLogin {
    return YES;
}

@end

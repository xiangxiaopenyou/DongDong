//
//  RequestManager.h
//  DongDong
//
//  Created by 项小盆友 on 16/6/6.
//  Copyright © 2016年 项小盆友. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
extern NSString * const BASEAPIURL;
extern NSString * const BASEIMAGEURL;

@interface RequestManager : AFHTTPSessionManager
+ (instancetype)sharedInstance;

@end

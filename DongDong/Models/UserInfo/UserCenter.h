//
//  UserCenter.h
//  DongDong
//
//  Created by 项小盆友 on 16/7/15.
//  Copyright © 2016年 项小盆友. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserCenter : NSObject
+ (UserCenter *)shareCenter;
- (BOOL)isLogin;
@end

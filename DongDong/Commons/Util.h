//
//  Util.h
//  DongDong
//
//  Created by 项小盆友 on 16/6/6.
//  Copyright © 2016年 项小盆友. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Util : NSObject
+ (BOOL)isEmpty:(id)sender;
+ (BOOL)validatePhone:(NSString *)phone;
+ (NSString *)compareDate:(NSDate *)date;
+ (NSString *)dateToString:(NSDate *)date;
+ (NSDate *)stringToDate:(NSString *)dateString;

@end

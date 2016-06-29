//
//  Util.m
//  DongDong
//
//  Created by 项小盆友 on 16/6/6.
//  Copyright © 2016年 项小盆友. All rights reserved.
//

#import "Util.h"

@implementation Util
+ (BOOL)isEmpty:(id)sender {
    if (sender == nil || [sender isEqual:@""] || sender == [NSNull null] || [sender isEqual:[NSNull null]]) {
        return YES;
    }
    if ([sender isKindOfClass:[NSString class]]) {
        sender = [sender stringByReplacingOccurrencesOfString:@" " withString:@""];
        if ([sender isEqual:@""]) {
            return YES;
        }
    }
    return NO;
}
+ (BOOL)validatePhone:(NSString *)phone {
    NSString *phoneRegex = @"1[3|5|7|8|][0-9]{9}";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    return [phoneTest evaluateWithObject:phone];
}
+ (NSURL *)urlWithString:(NSString *)urlString {
    NSURL *url = [NSURL URLWithString:urlString];
    return url;
}
+ (NSString *)compareDate:(NSDate *)date {
    NSTimeInterval secondsPerDay = 24 * 3600;
    NSDate *today = [NSDate date];
    NSDate *tomorrow = [today dateByAddingTimeInterval:secondsPerDay];
    NSDate *yesterday = [today dateByAddingTimeInterval:- secondsPerDay];
    NSString *todayString = [[today description] substringToIndex:10];
    NSString *tomorrowString = [[tomorrow description] substringToIndex:10];
    NSString *yesterdayString = [[yesterday description] substringToIndex:10];
    NSString *dateString = [[date description] substringToIndex:10];
    if ([dateString isEqualToString:todayString]) {
        return @"今天";
    } else if ([dateString isEqualToString:tomorrowString]) {
        return @"明天";
    } else if ([dateString isEqualToString:yesterdayString]) {
        return @"昨天";
    } else {
        return dateString;
    }
    
}
+ (NSString *)dateToString:(NSDate *)date {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setLocale:[NSLocale currentLocale]];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:SS"];
    NSString *dateString = [dateFormatter stringFromDate:date];
    return dateString;
}
+ (NSDate *)stringToDate:(NSString *)dateString {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setLocale:[NSLocale currentLocale]];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:SS"];
    NSDate *date = [dateFormatter dateFromString:dateString];
    return date;
}
+ (NSString *)numberString:(CGFloat)floatNumber {
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter  setNumberStyle:NSNumberFormatterNoStyle];
    [numberFormatter setMaximumFractionDigits:2];
    return [numberFormatter stringFromNumber:@(floatNumber)];
}
+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end

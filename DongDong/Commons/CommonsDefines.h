//
//  CommonsDefines.h
//  DongDong
//
//  Created by 项小盆友 on 16/6/6.
//  Copyright © 2016年 项小盆友. All rights reserved.
//
#import <UIKit/UIKit.h>

extern NSString * const USERID;

#define SCREEN_WIDTH CGRectGetWidth(UIScreen.mainScreen.bounds)
#define SCREEN_HEIGHT CGRectGetHeight(UIScreen.mainScreen.bounds)
#define NAVIGATIONBAR_COLOR [UIColor colorWithRed:255/255.0 green:97/255.0 blue:56/255.0 alpha:1.0]
#define TABBAR_TITLE_COLOR [UIColor colorWithRed:164/255.0 green:173/255.0 blue:188/255.0 alpha:1.0]
#define MAIN_BACKGROUND_COLOR [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1.0]
#define BREAK_LINE_COLOR [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0]
#define kRGBColor(r,g,b,a)	[UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define kHexRGBColorWithAlpha(rgbValue,a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:a]
#define kSystemFont(x) [UIFont systemFontOfSize:x]


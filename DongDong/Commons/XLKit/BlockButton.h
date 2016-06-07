//
//  BlockButton.h
//  MasonryTest
//
//  Created by 项小盆友 on 16/5/30.
//  Copyright © 2016年 项小盆友. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^ButtonBlocked) (id sender);

@interface BlockButton : UIButton
- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)color font:(UIFont *)font image:(UIImage *)image;
- (void)addEventHandler:(ButtonBlocked)handler event:(UIControlEvents)event;

@end

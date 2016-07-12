//
//  AreaPickerView.h
//  DongDong
//
//  Created by 项小盆友 on 16/7/11.
//  Copyright © 2016年 项小盆友. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AreaObject.h"
typedef void (^areaChosePickerBlock)(AreaObject *object);

@interface AreaPickerView : UIView
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *pickerViewHeightConstraint;

- (void)areaChosen:(areaChosePickerBlock)block;
- (void)show;
- (void)hide;

@end

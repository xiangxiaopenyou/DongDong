//
//  AreaPickerView.m
//  DongDong
//
//  Created by 项小盆友 on 16/7/11.
//  Copyright © 2016年 项小盆友. All rights reserved.
//

#import "AreaPickerView.h"
@interface AreaPickerView()<UIPickerViewDelegate, UIPickerViewDataSource>
@property (copy, nonatomic) areaChosePickerBlock pickerBlock;
@property (strong, nonatomic) AreaObject *areaObject;
@property (copy, nonatomic) NSArray *provinceArray;
@property (copy, nonatomic) NSArray *cityArray;
@property (copy, nonatomic) NSArray *areaArray;
@end

@implementation AreaPickerView
- (instancetype)init {
    if (self = [super init]) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"AreaPicker" owner:nil options:nil] firstObject];
        self.frame = [UIScreen mainScreen].bounds;
        self.provinceArray = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"area.plist" ofType:nil]];
        self.cityArray = [self.provinceArray[0][@"cities"] copy];
        self.areaArray = [self.cityArray[0][@"areas"] copy];
        self.areaObject.province = self.provinceArray[0][@"province"];
        self.areaObject.city = self.cityArray[0][@"city"];
        self.areaObject.area = self.areaArray[0];
        self.pickerViewHeightConstraint.constant = 0;
        [self layoutIfNeeded];
        
        self.userInteractionEnabled = YES;
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hide)]];
    }
    return self;
}

- (AreaObject *)areaObject {
    if (!_areaObject) {
        _areaObject = [[AreaObject alloc] init];
    }
    return _areaObject;
}

#pragma mark - functions
- (void)show {
    UIWindow *win = [[UIApplication sharedApplication] keyWindow];
    UIView *topView = [win.subviews firstObject];
    [topView addSubview:self];
    
    [UIView animateWithDuration:0.3 animations:^{
        self.pickerViewHeightConstraint.constant = 250;
        [self layoutIfNeeded];
    }];
}
- (void)hide {
    UIWindow *win = [[UIApplication sharedApplication] keyWindow];
    UIView *topView = [win.subviews firstObject];
    [topView addSubview:self];
    
    [UIView animateWithDuration:0.3 animations:^{
        self.pickerViewHeightConstraint.constant = 0;
        [self layoutIfNeeded];
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

#pragma mark - UIPickerView Delegate DataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 3;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    switch (component) {
        case 0:
            return self.provinceArray.count;
            break;
        case 1:
            return self.cityArray.count;
            break;
        case 2:
            return self.areaArray.count;
            break;
        default:
            return 0;
            break;
    }
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    switch (component) {
        case 0:
            return self.provinceArray[row][@"province"];
            break;
        case 1:
            return self.cityArray[row][@"city"];
            break;
        case 2:
            return self.areaArray[row];
            break;
        default:
            return @"";
            break;
    }
}
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    UILabel* pickerLabel = (UILabel*)view;
    if (!pickerLabel){
        pickerLabel = [[UILabel alloc] init];
        pickerLabel.minimumScaleFactor = 8.0;
        pickerLabel.adjustsFontSizeToFitWidth = YES;
        pickerLabel.textColor = kHexRGBColorWithAlpha(0x333333, 1.0);
        [pickerLabel setTextAlignment:NSTextAlignmentCenter];
        [pickerLabel setFont:[UIFont boldSystemFontOfSize:14]];
    }
    pickerLabel.text=[self pickerView:pickerView titleForRow:row forComponent:component];
    return pickerLabel;
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    switch (component) {
        case 0:{
            self.cityArray = self.provinceArray[row][@"cities"];
            [self.pickerView reloadComponent:1];
            [self.pickerView selectRow:0 inComponent:1 animated:YES];
            
            
            self.areaArray = [[self.cityArray objectAtIndex:0] objectForKey:@"areas"];
            [self.pickerView reloadComponent:2];
            [self.pickerView selectRow:0 inComponent:2 animated:YES];
            
            
            self.areaObject.province = self.provinceArray[row][@"province"];
            self.areaObject.city = self.cityArray[0][@"city"];
            self.areaObject.area = self.areaArray[0];
            
            break;
        }
        case 1:
        {
            self.areaArray = [[self.cityArray objectAtIndex:row] objectForKey:@"areas"];
            [self.pickerView reloadComponent:2];
            [self.pickerView selectRow:0 inComponent:2 animated:YES];
            
            
            self.areaObject.city = self.cityArray[row][@"city"];
            self.areaObject.area = self.areaArray[0];
            
            break;
        }
        case 2:{
            
            self.areaObject.city = self.areaArray[row];
            break;
        }
            
        default:
            break;
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (IBAction)finishButtonClick:(id)sender {
    if (self.pickerBlock) {
        self.pickerBlock(self.areaObject);
    }
    [self hide];
}
- (void)areaChosen:(areaChosePickerBlock)block {
    self.pickerBlock = block;
}

@end

//
//  AddAddressCommonCell.m
//  DongDong
//
//  Created by 项小盆友 on 16/7/8.
//  Copyright © 2016年 项小盆友. All rights reserved.
//

#import "AddAddressCommonCell.h"
#import "CommonsDefines.h"

@implementation AddAddressCommonCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self.textField setValue:kHexRGBColorWithAlpha(0xbcbcbc, 1.0) forKeyPath:@"_placeholderLabel.textColor"];
    if (!_line) {
        _line = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.frame) - 0.5, SCREEN_WIDTH, 0.5)];
        _line.backgroundColor = BREAK_LINE_COLOR;
    }
    [self.contentView addSubview:_line];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
#pragma mark - UITextField Delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}
//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
//    if ([string isEqualToString:@"\n"]) {
//        [textField resignFirstResponder];
//        return NO;
//    }
//    return YES;
//}

@end

//
//  WriteDetailAddressCell.m
//  DongDong
//
//  Created by 项小盆友 on 16/7/8.
//  Copyright © 2016年 项小盆友. All rights reserved.
//

#import "WriteDetailAddressCell.h"

@implementation WriteDetailAddressCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
#pragma mark - UITextView Delegate
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}
- (void)textViewDidChange:(UITextView *)textView {
    self.placeholderLabel.hidden = textView.text.length > 0 ? YES : NO;
}
- (void)textViewDidBeginEditing:(UITextView *)textView {
    NSInteger offset = 260 - (SCREEN_HEIGHT - 251);
    if (offset > 0) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(textViewDidBeginEdit:offset:)]) {
            [self.delegate textViewDidBeginEdit:textView offset:offset];
        }
    }
}


@end

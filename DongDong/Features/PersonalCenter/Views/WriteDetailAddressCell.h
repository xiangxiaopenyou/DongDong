//
//  WriteDetailAddressCell.h
//  DongDong
//
//  Created by 项小盆友 on 16/7/8.
//  Copyright © 2016年 项小盆友. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol WriteDetailAddressDelegate<NSObject>
@optional
- (void)textViewDidBeginEdit:(UITextView *)textView offset:(NSInteger)offset;
- (void)textViewDidChangeValue:(NSString *)valueString;
@end

@interface WriteDetailAddressCell : UITableViewCell<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UILabel *placeholderLabel;

@property (weak, nonatomic) id<WriteDetailAddressDelegate> delegate;

@end

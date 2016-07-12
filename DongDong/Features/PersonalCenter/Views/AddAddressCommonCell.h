//
//  AddAddressCommonCell.h
//  DongDong
//
//  Created by 项小盆友 on 16/7/8.
//  Copyright © 2016年 项小盆友. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddAddressCommonCell : UITableViewCell<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) UILabel *line;

@end

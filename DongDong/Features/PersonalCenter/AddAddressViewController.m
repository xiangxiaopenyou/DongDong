//
//  AddAddressViewController.m
//  DongDong
//
//  Created by 项小盆友 on 16/7/8.
//  Copyright © 2016年 项小盆友. All rights reserved.
//

#import "AddAddressViewController.h"
#import "AddAddressCommonCell.h"
#import "WriteDetailAddressCell.h"
#import "SetDefaultAddressCell.h"
#import "AreaPickerView.h"

@interface AddAddressViewController ()<UITableViewDelegate, UITableViewDataSource, WriteDetailAddressDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation AddAddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (self.addressModel) {
        self.navigationItem.title = kEditAddress;
    } else {
        self.navigationItem.title = kAddNewAddress;
    }
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(saveClick)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UITableView Delegate DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return section == 0 ? 4 : 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 && indexPath.row == 3) {
        return 76.0;
    } else {
        return 40.0;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (indexPath.row == 3) {
            static NSString *cellIdentifier = @"DetailAddressCell";
            WriteDetailAddressCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
            if (!cell) {
                cell = [[WriteDetailAddressCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            }
            cell.textView.tag = 999;
            cell.delegate = self;
            return cell;
        } else {
            static NSString *cellIdentifier = @"CommonCell";
            AddAddressCommonCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
            if (!cell) {
                cell = [[AddAddressCommonCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            }
            cell.textField.tag = indexPath.row + 1000;
            switch (indexPath.row) {
                case 0:{
                    cell.textField.placeholder = kReceiver;
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                }
                    break;
                case 1:{
                    cell.textField.placeholder = kPhoneNumber;
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    cell.textField.keyboardType = UIKeyboardTypeNumberPad;
                }
                    break;
                case 2:{
                    cell.textField.text = kAddressArea;
                    cell.textField.enabled = NO;
                    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                }
                    
                default:
                    break;
            }
            return cell;
        }
        
    } else {
        static NSString *cellIdentifier = @"SetDefaultCell";
        SetDefaultAddressCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
        if (!cell) {
            cell = [[SetDefaultAddressCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0 && indexPath.row == 2) {
        UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
        [keyWindow endEditing:YES];
        AddAddressCommonCell *cell = (AddAddressCommonCell *)[tableView cellForRowAtIndexPath:indexPath];
        AreaPickerView *pickerView = [[AreaPickerView alloc] init];
        [pickerView areaChosen:^(AreaObject *object) {
            cell.textField.text = [NSString stringWithFormat:@"%@%@%@", object.province, object.city, object.area];
        }];
        [pickerView show];
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return section == 0 ? 0 : 8;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

#pragma mark - WriteDetailAddressDelegate
- (void)textViewDidBeginEdit:(UITextView *)textView offset:(NSInteger)offset {
    if (textView && offset) {
        [self.tableView setContentOffset:CGPointMake(0, offset) animated:YES];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - Action
- (void)saveClick {}

@end

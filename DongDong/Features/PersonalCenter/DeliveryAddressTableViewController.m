//
//  DeliveryAddressTableViewController.m
//  DongDong
//
//  Created by 项小盆友 on 16/7/5.
//  Copyright © 2016年 项小盆友. All rights reserved.
//

#import "DeliveryAddressTableViewController.h"
#import "AddAddressViewController.h"
#import "AddressModel.h"
#import "DeliveryAddressCell.h"
#import "CommonsDefines.h"
#import "Util.h"
#import "XLBlockAlertView.h"

@interface DeliveryAddressTableViewController ()<DeliveryAddressCellDelegate>
@property (strong, nonatomic) NSMutableArray *addressArray;

@end

@implementation DeliveryAddressTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"管理收货地址";
    AddressModel *model1 = [AddressModel new];
    model1.addressId = @"1";
    model1.name = @"项林平";
    model1.phone = @"13732254511";
    model1.areaAddress = @"浙江省杭州市下城区";
    model1.detailAddress = @"河东路25号河东社区18幢3单元203";
    model1.isDefault = @(1);
    
    AddressModel *model2 = [AddressModel new];
    model2.addressId = @"2";
    model2.name = @"项小朋友";
    model2.phone = @"13735525039";
    model2.areaAddress = @"浙江省杭州市江干区";
    model2.detailAddress = @"浙江工商大学金沙港生活区5幢512";
    model2.isDefault = @(0);
    
    AddressModel *model3 = [AddressModel new];
    model3.addressId = @"3";
    model3.name = @"项小盆友";
    model3.phone = @"13732254711";
    model3.areaAddress = @"浙江省金华市浦江县";
    model3.detailAddress = @"檀溪镇项丰村38号";
    model3.isDefault = @(0);
    
    _addressArray = [@[model1, model2, model3] mutableCopy];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"添加" style:UIBarButtonItemStylePlain target:self action:@selector(addAddress)];
    //去掉返回按钮的文字
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@""
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:self
                                                                            action:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _addressArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat height = 100.0;
    //根据地址长度调整cell高度
    AddressModel *tempModel = _addressArray[indexPath.row];
    NSString *addressString = [NSString stringWithFormat:@"%@%@", tempModel.areaAddress, tempModel.detailAddress];
    CGSize addressSize = [Util sizeOfText:addressString width:SCREEN_WIDTH - 20.0 font:kSystemFont(13)];
    height += addressSize.height;
    return height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"AddressCell";
    DeliveryAddressCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    if (!cell) {
        cell = [[DeliveryAddressCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.delegate = self;
    AddressModel *tempModel = _addressArray[indexPath.row];
    [cell initModel:tempModel];
    cell.nameLabel.text = tempModel.name;
    cell.phoneLabel.text = tempModel.phone;
    cell.addressLabel.text = [NSString stringWithFormat:@"%@%@", tempModel.areaAddress, tempModel.detailAddress];
    if ([tempModel.isDefault integerValue] == 1) {
        cell.enableButton.selected = YES;
    } else {
        cell.enableButton.selected = NO;
    }
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - DeliveryAddressCellDelegate
- (void)addressSetDefault:(AddressModel *)model {
    for (AddressModel *tempModel in _addressArray) {
        if ([tempModel.addressId isEqual:model.addressId]) {
            tempModel.isDefault = @(1);
        } else {
            tempModel.isDefault = @(0);
        }
    }
    [self.tableView reloadData];
}
- (void)addressDidClickEdit:(AddressModel *)model {
    AddAddressViewController *addAddressViewController = [[UIStoryboard storyboardWithName:@"PersonalCenter" bundle:nil] instantiateViewControllerWithIdentifier:@"AddAddressView"];
    addAddressViewController.addressModel = model;
    [self.navigationController pushViewController:addAddressViewController animated:YES];
}
- (void)addressDidClickDelete:(AddressModel *)model {
    __weak DeliveryAddressTableViewController *weakSelf = self;
    [[[XLBlockAlertView alloc] initWithTitle:nil message:@"确认要删除此收货地址吗？" block:^(NSInteger buttonIndex) {
        __strong DeliveryAddressTableViewController *strongSelf = weakSelf;
        if (buttonIndex == 1) {
            [strongSelf.addressArray removeObject:model];
            [strongSelf.tableView reloadData];
        }
    } cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil] show];
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
/**
 *  添加地址
 */
- (void)addAddress {
    AddAddressViewController *addAddressViewController = [[UIStoryboard storyboardWithName:@"PersonalCenter" bundle:nil] instantiateViewControllerWithIdentifier:@"AddAddressView"];
    [self.navigationController pushViewController:addAddressViewController animated:YES];
}

@end

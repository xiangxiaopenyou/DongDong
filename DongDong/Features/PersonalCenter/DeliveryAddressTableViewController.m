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

@interface DeliveryAddressTableViewController ()
@property (strong, nonatomic) NSMutableArray *addressArray;

@end

@implementation DeliveryAddressTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"管理收货地址";
    AddressModel *model1 = [AddressModel new];
    model1.name = @"项林平";
    model1.phone = @"13732254511";
    model1.address = @"打开就罚款的合法的合法的及合法进口的话费卡接收到的加班费安静的首发的开发和的撒发的数据库放";
    
    AddressModel *model2 = [AddressModel new];
    model2.name = @"项小朋友";
    model2.phone = @"13735525039";
    model2.address = @"打开就罚款的合法的合法的及合法进口的话费卡接收到的加班费安静的首发的开发和的撒发的数据库放爱的饭卡大奖是开放";
    
    AddressModel *model3 = [AddressModel new];
    model3.name = @"项小盆友";
    model3.phone = @"13732254711";
    model3.address = @"打开就罚款的合法的合法的及合法进口";
    
    _addressArray = [@[model1, model2, model3] mutableCopy];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"添加" style:UIBarButtonItemStylePlain target:self action:@selector(addAddress)];
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
    CGSize addressSize = [Util sizeOfText:tempModel.address width:SCREEN_WIDTH - 20.0 font:kSystemFont(13)];
    height += addressSize.height;
    return height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"AddressCell";
    DeliveryAddressCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    if (!cell) {
        cell = [[DeliveryAddressCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    AddressModel *tempModel = _addressArray[indexPath.row];
    cell.nameLabel.text = tempModel.name;
    cell.phoneLabel.text = tempModel.phone;
    cell.addressLabel.text = tempModel.address;
    
    // Configure the cell...
    
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

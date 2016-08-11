//
//  OrderDetailViewController.m
//  DongDong
//
//  Created by 项小盆友 on 16/7/27.
//  Copyright © 2016年 项小盆友. All rights reserved.
//

#import "OrderDetailViewController.h"
#import "OrderAddressCell.h"
#import "OrderDetailCell.h"
#import "OrderInformationCell.h"

@interface OrderDetailViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *bottomView;

@end

@implementation OrderDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = kOrderDetail;
    [self.tableView reloadData];
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView Delegate DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat cellHeight = 0;
    switch (indexPath.section) {
        case 0:{
            CGSize addressSize = XLSizeOfText(_orderModel.orderAddress, SCREEN_WIDTH - 59, kSystemFont(12));
            cellHeight = 40 + addressSize.height;
        }
            break;
        case 1:{
            NSArray *tempArray = _orderModel.goodsArray;
            cellHeight = tempArray.count * 82.0 + 110;
            
        }
            break;
        case 2:{
            cellHeight = 100;
        }
        default:
            break;
    }
    return cellHeight;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0:{
            static NSString *cellIdentifier = @"OrderAddressCell";
            OrderAddressCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
            if (!cell) {
                cell = [[OrderAddressCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            }
            cell.consigneeNameLabel.text = [NSString stringWithFormat:@"收件人：%@", _orderModel.consigneeName];
            cell.consigneePhoneLabel.text = [NSString stringWithFormat:@"%@", _orderModel.consigneePhone];
            cell.orderAddressLabel.text = [NSString stringWithFormat:@"%@", _orderModel.orderAddress];
            return cell;
        }
            break;
        case 1:{
            static NSString *cellIdentifier = @"OrderDetailCell";
            OrderDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
            if (!cell) {
                cell = [[OrderDetailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            }
            [cell setupContentWith:_orderModel];
            return cell;
        }
            break;
        case 2:{
            static NSString *cellIdentifier = @"OrderInformationCell";
            OrderInformationCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
            if (!cell) {
                cell = [[OrderInformationCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            }
            return cell;
        }
        default:
            return nil;
            break;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return section == 0 ? 0 : 5;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [UIView new];
    headerView.backgroundColor = [UIColor clearColor];
    return headerView;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

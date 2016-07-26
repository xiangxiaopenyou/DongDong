//
//  MessageTableViewController.m
//  DongDong
//
//  Created by 项小盆友 on 16/6/29.
//  Copyright © 2016年 项小盆友. All rights reserved.
//

#import "MessageTableViewController.h"
#import "MessageCell.h"
#import "MessageModel.h"
#import <Masonry.h>

@interface MessageTableViewController ()
@property (strong, nonatomic) NSMutableArray *messageArray;

@end

@implementation MessageTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    MessageModel *model1 = [MessageModel new];
    model1.messageContent = @"您的商品已经发货，请及时查收";
    model1.messageImageUrlString = @"http://img1.3lian.com/img013/v4/57/d/17.jpg";
    model1.messageDateString = @"2016年7月4号 13:31";
    
    MessageModel *model2 = [MessageModel new];
    model2.messageContent = @"您的商品已经发货，请及时查收噢";
    model2.messageImageUrlString = @"http://img1.3lian.com/img013/v4/57/d/18.jpg";
    model2.messageDateString = @"2016年7月4号 11:11";
    
    _messageArray = [@[model1, model2] mutableCopy];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _messageArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"MessageCell";
    MessageCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    [cell setupContentWith:_messageArray[indexPath.row]];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return _messageArray.count == 0 ? 170 : 0;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] init];
    headerView.backgroundColor = [UIColor clearColor];
    UILabel *emptyLabel = [[UILabel alloc] init];
    emptyLabel.font = kSystemFont(14);
    emptyLabel.textColor = kHexRGBColorWithAlpha(0x8c8c8c, 1.0);
    emptyLabel.text = kHaveNoMessage;
    [headerView addSubview:emptyLabel];
    [emptyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(headerView);
        make.bottom.equalTo(headerView.mas_bottom);
    }];
    return headerView;
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

@end

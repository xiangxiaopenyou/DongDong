//
//  InformationEditTableViewController.m
//  DongDong
//
//  Created by 项小盆友 on 16/6/29.
//  Copyright © 2016年 项小盆友. All rights reserved.
//

#import "InformationEditTableViewController.h"
#import "DeliveryAddressTableViewController.h"

@interface InformationEditTableViewController ()
@property (strong, nonatomic) UIImageView *portraintImageView;

@end

@implementation InformationEditTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.navigationItem.title = kPersonalInformation;
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@""
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:self
                                                                            action:nil];
}

/**
 *  头像
 */
-  (UIImageView *)portraintImageView {
    if (!_portraintImageView) {
        _portraintImageView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 50, 5, 36, 36)];
        _portraintImageView.layer.masksToBounds = YES;
        _portraintImageView.layer.cornerRadius = 18.0;
        _portraintImageView.backgroundColor = [UIColor redColor];
    }
    return _portraintImageView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return section == 0 ? 2 : 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 46.0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"InformationCell"];
    cell.textLabel.font = kSystemFont(14);
    cell.textLabel.textColor = kHexRGBColorWithAlpha(0x8c8c8c, 1.0);
    cell.detailTextLabel.font = kSystemFont(14);
    cell.detailTextLabel.textColor = MAIN_TEXT_COLOR;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:{
                cell.accessoryType = UITableViewCellAccessoryNone;
                cell.textLabel.text = @"修改头像";
                [cell.contentView addSubview:self.portraintImageView];
                
                UILabel *line = [[UILabel alloc] initWithFrame:CGRectMake(0, 45.5, SCREEN_WIDTH, 0.5)];
                line.backgroundColor = BREAK_LINE_COLOR;
                [cell.contentView addSubview:line];
            }
                break;
            case 1:{
                cell.textLabel.text = @"昵称";
                cell.detailTextLabel.text = @"项小盆友";
            }
                break;
                
            default:
                break;
        }
    } else {
        cell.textLabel.text = @"收货地址";
    }
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return section == 0 ? 0 : 15;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0) {
        
    } else {
        DeliveryAddressTableViewController *addressView = [[UIStoryboard storyboardWithName:@"PersonalCenter" bundle:nil] instantiateViewControllerWithIdentifier:@"DeliveryAddressView"];
        [self.navigationController pushViewController:addressView animated:YES];
    }
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

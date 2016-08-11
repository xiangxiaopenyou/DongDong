//
//  InformationEditTableViewController.m
//  DongDong
//
//  Created by 项小盆友 on 16/6/29.
//  Copyright © 2016年 项小盆友. All rights reserved.
//

#import "InformationEditTableViewController.h"
#import "DeliveryAddressTableViewController.h"
#import "EditNicknameTableViewController.h"
#import "XLBlockActionSheet.h"
#import "XLBlockAlertView.h"

@interface InformationEditTableViewController ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate>
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
}

/**
 *  头像
 */
-  (UIImageView *)portraintImageView {
    if (!_portraintImageView) {
        _portraintImageView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 50, 5, 36, 36)];
        _portraintImageView.layer.masksToBounds = YES;
        _portraintImageView.layer.cornerRadius = 18.0;
    }
    return _portraintImageView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/**
 *  头像选择（拍照或者相册选择）
 */
- (void)pickImageForAvatar:(UIImagePickerControllerSourceType)sourceType {
    UIImagePickerController *pickerController = [[UIImagePickerController alloc] init];
    pickerController.delegate = self;
    pickerController.allowsEditing = YES;
    pickerController.sourceType = sourceType;
    [self presentViewController:pickerController animated:YES completion:nil];
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
                cell.textLabel.text = kChangeAvatar;
                [cell.contentView addSubview:self.portraintImageView];
                
                UILabel *line = [[UILabel alloc] initWithFrame:CGRectMake(0, 45.5, SCREEN_WIDTH, 0.5)];
                line.backgroundColor = BREAK_LINE_COLOR;
                [cell.contentView addSubview:line];
            }
                break;
            case 1:{
                cell.textLabel.text = kUserNickname;
                cell.detailTextLabel.text = @"项小盆友";
            }
                break;
                
            default:
                break;
        }
    } else {
        cell.textLabel.text = kDeliveryAddress;
    }
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return section == 0 ? 0 : 15;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            [[[XLBlockActionSheet alloc] initWithTitle:nil clickedBlock:^(NSInteger buttonIndex) {
                if (buttonIndex == 1) {
                    //拍照
                    if (!XLIsCameraAvailable) {
                        [SVProgressHUD showInfoWithStatus:kCameraNotAvailable];
                        return;
                    }
                    if (!XLIsAppCameraAccessAuthorized) {
                        [[[XLBlockAlertView alloc] initWithTitle:@"提示" message:kAppCameraAccessNotAuthorized block:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil] show];
                        return;
                    }
                    [self pickImageForAvatar:UIImagePickerControllerSourceTypeCamera];
                } else if (buttonIndex == 2) {
                    //相册
                    if (!XLIsAppPhotoLibraryAccessAuthorized) {
                        [[[XLBlockAlertView alloc] initWithTitle:@"提示" message:kAppPhotoLibraryAccessNotAuthorized block:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil] show];
                        return;
                    }
                    [self pickImageForAvatar:UIImagePickerControllerSourceTypePhotoLibrary];
                }
            } cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照", @"从手机相册选择", nil] showInView:self.view];
        } else {
            EditNicknameTableViewController *editNicknameView = [self.storyboard instantiateViewControllerWithIdentifier:@"EditNicknameView"];
            editNicknameView.oldNickname = @"项小盆友";
            [self.navigationController pushViewController:editNicknameView animated:YES];
        }
    } else {
        DeliveryAddressTableViewController *addressView = [self.storyboard instantiateViewControllerWithIdentifier:@"DeliveryAddressView"];
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

#pragma mark - UIImagePickerController Delegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    [picker dismissViewControllerAnimated:YES completion:nil];
    UIImage *resultImage = [info objectForKey:UIImagePickerControllerEditedImage];
    if (resultImage) {
        self.portraintImageView.image = resultImage;
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

@end

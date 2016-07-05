//
//  PersonalCenterViewController.m
//  DongDong
//
//  Created by 项小盆友 on 16/6/27.
//  Copyright © 2016年 项小盆友. All rights reserved.
//

#import "PersonalCenterViewController.h"
#import "Util.h"
#import "CommonsDefines.h"
#import "InformationEditTableViewController.h"

@interface PersonalCenterViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topImageHeightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topImageTopConstraint;
@property (weak, nonatomic) IBOutlet UIImageView *portraitImageView;
@property (weak, nonatomic) IBOutlet UILabel *nicknameLabel;
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIButton *button3;
@property (weak, nonatomic) IBOutlet UIButton *button4;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lineHeightConstraint;
@property (strong, nonatomic) UIImage *shadowImage;

@property (strong, nonatomic) UIButton *messageButton;

@end

@implementation PersonalCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"";
    _shadowImage = self.navigationController.navigationBar.shadowImage;
    [self setButtonContent];
    
    _messageButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _messageButton.frame = CGRectMake(0, 0, 40, 40);
    [_messageButton setImage:[UIImage imageNamed:@"message"] forState:UIControlStateNormal];
    [_messageButton setImage:[UIImage imageNamed:@"unread_message"] forState:UIControlStateSelected];
    [_messageButton addTarget:self action:@selector(messageClick) forControlEvents:UIControlEventTouchUpInside];
    _messageButton.imageEdgeInsets = UIEdgeInsetsMake(0, 19, 0, - 19);
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_messageButton];
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
    
    self.tableView.tableFooterView = [UIView new];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setBackgroundImage:[Util imageWithColor:NAVIGATIONBAR_COLOR]
                                                  forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.shadowImage = _shadowImage;
}
/**
 *  设置按钮图片文字上下显示
 */
- (void)setButtonContent {
    self.button1.imageEdgeInsets = UIEdgeInsetsMake(- 25, 16, 0, -16);
    self.button1.titleEdgeInsets = UIEdgeInsetsMake(0, -16, - 25, 16);
    
    self.button2.imageEdgeInsets = UIEdgeInsetsMake(- 25, 16, 0, -16);
    self.button2.titleEdgeInsets = UIEdgeInsetsMake(0, -16, - 25, 16);
    
    self.button3.imageEdgeInsets = UIEdgeInsetsMake(- 25, 16, 0, -16);
    self.button3.titleEdgeInsets = UIEdgeInsetsMake(0, -16, - 25, 16);
    
    self.button4.imageEdgeInsets = UIEdgeInsetsMake(- 25, 16, 0, -16);
    self.button4.titleEdgeInsets = UIEdgeInsetsMake(0, -16, - 25, 16);
    self.lineHeightConstraint.constant = 0.5;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView Delegate DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 45.0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.font = kSystemFont(14);
    cell.textLabel.textColor = kHexRGBColorWithAlpha(0x494e52, 1.0);
    switch (indexPath.row) {
        case 0:{
            cell.textLabel.text = @"我的收藏";
            cell.imageView.image = [UIImage imageNamed:@"collection"];
        }
            break;
        case 1:{
            cell.textLabel.text = @"联系客服";
            cell.imageView.image = [UIImage imageNamed:@"phone"];
        }
            break;
        case 2:{
            cell.textLabel.text = @"系统设置";
            cell.imageView.image = [UIImage imageNamed:@"setting"];
        }
            break;
            
        default:
            break;
    }
    UILabel *line = [[UILabel alloc] initWithFrame:CGRectMake(0, 44.5, SCREEN_WIDTH, 0.5)];
    line.backgroundColor = BREAK_LINE_COLOR;
    [cell addSubview:line];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 12;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat y = scrollView.contentOffset.y;
    if (y < 0) {
        self.topImageTopConstraint.constant = 0;
        self.topImageHeightConstraint.constant = 140 - y;
    } else {
        self.topImageTopConstraint.constant = - y;
        self.topImageHeightConstraint.constant = 140;
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
- (IBAction)allOrderClick:(id)sender {
}

- (IBAction)orderButtonsClick:(id)sender {
}

- (void)messageClick {
}
- (IBAction)editInformation:(id)sender {
    InformationEditTableViewController *informationView = [[UIStoryboard storyboardWithName:@"PersonalCenter" bundle:nil] instantiateViewControllerWithIdentifier:@"InformationEditView"];
    [self.navigationController pushViewController:informationView animated:YES];
    
}


@end

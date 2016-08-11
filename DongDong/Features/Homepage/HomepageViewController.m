//
//  HomepageViewController.m
//  DongDong
//
//  Created by 项小盆友 on 16/6/15.
//  Copyright © 2016年 项小盆友. All rights reserved.
//

#import "HomepageViewController.h"
#import "GoodsListCell.h"
#import "GoodsModel.h"
#import "MessageTableViewController.h"
#import "GoodsDetailViewController.h"

#import <SDCycleScrollView.h>
#import <GJCFUitils.h>

@interface HomepageViewController ()<UITableViewDelegate, UITableViewDataSource, SDCycleScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) UIButton *messageButton;

@property (strong, nonatomic) NSMutableArray *gooodsArray;

@end

@implementation HomepageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = kAppName;
    
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.messageButton];
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
    
    GoodsModel *model1 = [GoodsModel new];
    model1.mainImageUrl = @"http://img1.3lian.com/img013/v4/57/d/11.jpg";
    model1.goodsName = @"潮款男裤";
    model1.goodsPrice = @(100);
    
    GoodsModel *model2 = [GoodsModel new];
    model2.mainImageUrl = @"http://img1.3lian.com/img013/v4/57/d/12.jpg";
    model2.goodsName = @"我擦";
    model2.goodsPrice = @(59.9);
    
    GoodsModel *model3 = [GoodsModel new];
    model3.mainImageUrl = @"http://img1.3lian.com/img013/v4/57/d/1.jpg";
    model3.goodsName = @"哈哈";
    model3.goodsPrice = @(5999.99);
    
    GoodsModel *model4 = [GoodsModel new];
    model4.mainImageUrl = @"http://img1.3lian.com/img013/v4/57/d/15.jpg";
    model4.goodsName = @"项小盆友爱上的浪费空间大师浪费空间打算减肥打算开飞机";
    model4.goodsPrice = @(59.9);
    
    GoodsModel *model5 = [GoodsModel new];
    model5.mainImageUrl = @"http://img1.3lian.com/img013/v4/57/d/16.jpg";
    model5.goodsName = @"啊啊啊啊啊啊啊啊啊";
    model5.goodsPrice = @(5999.99);
    
    _gooodsArray = [@[model1, model2, model3, model4, model5] mutableCopy];
    [self initTableHeaderView];
}
/**
 *  TableHeaderView
 */
- (void)initTableHeaderView {
    NSArray *imageUrlArray = @[@"http://img1.3lian.com/img013/v4/57/d/4.jpg"
                               , @"http://img1.3lian.com/img013/v4/57/d/7.jpg"
                               , @"http://img1.3lian.com/img013/v4/57/d/6.jpg",
                               @"http://img1.3lian.com/img013/v4/57/d/8.jpg",
                               @"http://img1.3lian.com/img013/v4/57/d/2.jpg"
                               ];
    SDCycleScrollView *bannerView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 150) imageURLStringsGroup:imageUrlArray];
    bannerView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    bannerView.autoScrollTimeInterval = 5.0;
    bannerView.contentMode = UIViewContentModeScaleAspectFill;
    bannerView.bannerImageViewContentMode = UIViewContentModeScaleAspectFill;
    bannerView.clipsToBounds = YES;
    bannerView.delegate = self;
    [self.tableView.tableHeaderView addSubview:bannerView];
}
/**
 *  消息按钮
 */
- (UIButton *)messageButton {
    if (!_messageButton) {
        _messageButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _messageButton.frame = CGRectMake(0, 0, 46, 40);
        [_messageButton setImage:[UIImage imageNamed:@"message"] forState:UIControlStateNormal];
        [_messageButton setImage:[UIImage imageNamed:@"unread_message"] forState:UIControlStateSelected];
        [_messageButton addTarget:self action:@selector(messageClick) forControlEvents:UIControlEventTouchUpInside];
        _messageButton.imageEdgeInsets = UIEdgeInsetsMake(0, 19, 0, - 19);
    }
    return _messageButton;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView Delegate DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _gooodsArray.count % 2 == 0 ? _gooodsArray.count / 2 : _gooodsArray.count / 2 + 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 4.0 / 3.0 * (SCREEN_WIDTH - 26) / 2 + 65.0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"GoodsListCell";
    GoodsListCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[GoodsListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    GoodsModel *rightModel = [GoodsModel new];
    if (indexPath.row * 2 + 1 >= _gooodsArray.count) {
        rightModel = nil;
    } else {
        rightModel = _gooodsArray[indexPath.row * 2 + 1];
    }
    GJCFWeakSelf weakSelf = self;
    [cell goodsClickBlock:^(GoodsModel *model) {
        NSLog(@"name: %@\nprice: %@", model.goodsName, model.goodsPrice);
        GoodsDetailViewController *detailViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"GoodsDetailView"];
        [weakSelf.navigationController pushViewController:detailViewController animated:YES];
    }];
    [cell setupContentWith:_gooodsArray[indexPath.row * 2] rightModel:rightModel];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 37.0;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 37)];
    headerView.backgroundColor = MAIN_BACKGROUND_COLOR;
    UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(11, 9, 19, 19)];
    image.image = [UIImage imageNamed:@"choice"];
    [headerView addSubview:image];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(35, 0, 100, 37)];
    label.font = kSystemFont(12);
    label.textColor = kRGBColor(73, 78, 82, 1.0);
    label.text = kSelectedGoods;
    [headerView addSubview:label];
    return headerView;
}

#pragma mark - SDCycleScrollView Delegate
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
}


#pragma mark - Action
- (void)messageClick {
    MessageTableViewController *messageView = [[UIStoryboard storyboardWithName:@"Message" bundle:nil] instantiateViewControllerWithIdentifier:@"MessageView"];
    [self.navigationController pushViewController:messageView animated:YES];
//    ChoosePaymentFormTableViewController *view = [[UIStoryboard storyboardWithName:@"Homepage" bundle:nil] instantiateViewControllerWithIdentifier:@"PaymentView"];
//    [self.navigationController pushViewController:view animated:YES];
}
/*
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
 
}
 */


@end

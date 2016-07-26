//
//  GoodsDetailViewController.m
//  DongDong
//
//  Created by 项小盆友 on 16/7/21.
//  Copyright © 2016年 项小盆友. All rights reserved.
//

#import "GoodsDetailViewController.h"

#import "GoodsInformationCell.h"
#import "ChooseStyleCell.h"
#import "GoodsEvaluationCell.h"
#import "GoodsStyleView.h"

#import <UIImageView+AFNetworking.h>
#import <MJRefresh.h>
#import <SDCycleScrollView.h>

@interface GoodsDetailViewController ()<UITableViewDelegate, UITableViewDataSource, SDCycleScrollViewDelegate, UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UITableView *topTableView;
@property (weak, nonatomic) IBOutlet UITableView *detailTableView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topTableViewHeightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *detailTableViewHeightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topTableViewTopConstraint;
@property (weak, nonatomic) IBOutlet UIButton *shoppingCartButton;
@property (weak, nonatomic) IBOutlet UIView *navigation;
@property (weak, nonatomic) IBOutlet UIButton *collectButton;
@property (strong, nonatomic) UILabel *detailHeaderLabel;

@property (strong, nonatomic) NSArray *goodsImagesArray;
@property (assign, nonatomic) BOOL isShowDetail;
@end

@implementation GoodsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    self.goodsImagesArray = @[@"http://img1.3lian.com/img013/v4/57/d/4.jpg"
                               , @"http://img1.3lian.com/img013/v4/57/d/7.jpg"
                               , @"http://img1.3lian.com/img013/v4/57/d/6.jpg",
                               @"http://img1.3lian.com/img013/v4/57/d/8.jpg",
                               @"http://img1.3lian.com/img013/v4/57/d/2.jpg"
                               ];
    [self initTableHeaderView];
    [self initRefreshView];
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.topTableViewHeightConstraint.constant = SCREEN_HEIGHT - TABBARHEIGHT;
    self.detailTableViewHeightConstraint.constant = SCREEN_HEIGHT - TABBARHEIGHT - NAVIGATIONBARHEIGHT;
}
- (void)initTableHeaderView {
    SDCycleScrollView *bannerView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH) imageURLStringsGroup:self.goodsImagesArray];
    bannerView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
    bannerView.autoScroll = NO;
    bannerView.autoScrollTimeInterval = 5.0;
    bannerView.contentMode = UIViewContentModeScaleAspectFill;
    bannerView.bannerImageViewContentMode = UIViewContentModeScaleAspectFill;
    bannerView.clipsToBounds = YES;
    bannerView.delegate = self;
    self.topTableView.tableHeaderView = bannerView;
}
- (void)initRefreshView {
    [self.topTableView setMj_header:[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        NSLog(@"刷新");
    }]];
    [self.detailTableView addSubview:self.detailHeaderLabel];
}
- (UILabel *)detailHeaderLabel {
    if (!_detailHeaderLabel) {
        _detailHeaderLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, -30, SCREEN_WIDTH, 30)];
        _detailHeaderLabel.font = kSystemFont(12);
        _detailHeaderLabel.textColor = MAIN_TEXT_COLOR;
        _detailHeaderLabel.text = kDrapDownToBack;
        _detailHeaderLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _detailHeaderLabel;
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
    CGFloat height = 0;
    switch (indexPath.row) {
        case 0:
            height = 66.0;
            break;
        case 1:
            height = 47.0;
            break;
        case 2:
            height = 140.0;
        default:
            break;
    }
    return height;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        static NSString *cellIdentifier = @"GoodsInformationCell";
        GoodsInformationCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (!cell) {
            cell = [[GoodsInformationCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    } else if (indexPath.row == 1) {
        static NSString *cellIdentifier = @"ChooseStyleCell";
        ChooseStyleCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (!cell) {
            cell = [[ChooseStyleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    } else {
        static NSString *cellIdentifier = @"GoodsEvaluationCell";
        GoodsEvaluationCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (!cell) {
            cell = [[GoodsEvaluationCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 1) {
        GoodsStyleView *view = [[GoodsStyleView alloc] initWithFrame:self.view.frame color:@[@"红色", @"黄色", @"绿色", @"紫红色", @"土豪金"] size:@[@"S", @"M", @"L", @"XL", @"XXL", @"S", @"M", @"L", @"XL", @"XXL"]];
        [view show];
    }
}

#pragma mark - UIScrollView Delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == self.detailTableView) {
        CGFloat currentPositionY = scrollView.contentOffset.y;
        if (currentPositionY <= - 40) {
            self.detailHeaderLabel.text = kReleaseToBack;
        } else {
            self.detailHeaderLabel.text = kDrapDownToBack;
        }
    } else if (scrollView == self.topTableView) {
        if (!_isShowDetail) {
            CGFloat currentPositionY = scrollView.contentOffset.y;
            if (currentPositionY <= 100 && currentPositionY >= 0) {
                self.navigation.backgroundColor = kRGBColor(255, 97, 56, 0.01 * currentPositionY);
            } else if (currentPositionY > 100) {
                self.navigation.backgroundColor = kRGBColor(255, 97, 56, 1);
            } else {
                self.navigation.backgroundColor = kRGBColor(255, 97, 56, 0);
            }
        }
       
    }
    
    
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (scrollView == self.topTableView) {
        CGFloat contentHeight = 290.0 + SCREEN_WIDTH;
        CGFloat resultHeight = contentHeight - SCREEN_HEIGHT + TABBARHEIGHT;
        CGFloat currentPositionY = scrollView.contentOffset.y;
        if (currentPositionY - resultHeight >= 40.0) {
            self.topTableViewTopConstraint.constant = TABBARHEIGHT - SCREEN_HEIGHT;
            [UIView animateWithDuration:0.3 animations:^{
                [self.view layoutIfNeeded];
            }];
            _isShowDetail = YES;
        }
    } else if (scrollView == self.detailTableView) {
        CGFloat currentPositionY = scrollView.contentOffset.y;
        if (currentPositionY <= - 40.0) {
            self.topTableViewTopConstraint.constant = 0;
            [UIView animateWithDuration:0.3 animations:^{
                [self.view layoutIfNeeded];
            }];
            _isShowDetail = NO;
        }
    }
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (_isShowDetail) {
        self.navigation.backgroundColor = kRGBColor(255, 97, 56, 1);
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
- (IBAction)backClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
/**
 *  购物车
 */
- (IBAction)shoppingCartClick:(id)sender {
}

/**
 *  加入购物车
 */
- (IBAction)addToShoppingCartClick:(id)sender {
}

/**
 *  立即购买
 */
- (IBAction)buyNowClick:(id)sender {
}

/**
 *  客服
 */
- (IBAction)customerServiceClick:(id)sender {
}

/**
 *  收藏/取消收藏
 */
- (IBAction)collectClick:(id)sender {
}

@end

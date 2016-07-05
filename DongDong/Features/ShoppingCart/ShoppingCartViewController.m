//
//  ShoppingCartViewController.m
//  DongDong
//
//  Created by 项小盆友 on 16/6/17.
//  Copyright © 2016年 项小盆友. All rights reserved.
//

#import "ShoppingCartViewController.h"
#import "ShoppingCartCell.h"
#import "CartGoodsModel.h"
#import "CommonsDefines.h"
#import "Util.h"
#import <Masonry.h>

@interface ShoppingCartViewController ()<UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *balanceView;
@property (weak, nonatomic) IBOutlet UILabel *totalPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *luggageLabel;
@property (weak, nonatomic) IBOutlet UIButton *selectAllButton;
@property (weak, nonatomic) IBOutlet UIButton *deleteOrBalanceButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomViewHeightConstraint;

@property (strong, nonatomic) UIButton *editButton;

@property (strong, nonatomic) NSMutableArray *cartGoodsArray;
@property (strong, nonatomic) NSMutableArray *selectedGoodsArray;
@property (strong, nonatomic) NSMutableArray *selectedDeleteGoodsArray;

@end

@implementation ShoppingCartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CartGoodsModel *model1 = [CartGoodsModel new];
    model1.goodsMainImageUrl = @"http://img1.3lian.com/img013/v4/57/d/17.jpg";
    model1.goodsName = @"裤子阿里的房间卡啊大厦法定发贺卡的回复爱的是开发大康师傅好";
    model1.goodsPrice = @(88.88);
    model1.goodsColor = @"蓝色";
    model1.goodsSize = @"XXL";
    model1.goodsQuantity = @(1);
    
    CartGoodsModel *model2 = [CartGoodsModel new];
    model2.goodsMainImageUrl = @"http://img1.3lian.com/img013/v4/57/d/18.jpg";
    model2.goodsName = @"衣服开发大康师傅好";
    model2.goodsPrice = @(8.8);
    model2.goodsColor = @"黄色";
    model2.goodsSize = @"S";
    model2.goodsQuantity = @(2);
    
    CartGoodsModel *model3 = [CartGoodsModel new];
    model3.goodsMainImageUrl = @"http://img1.3lian.com/img013/v4/57/d/19.jpg";
    model3.goodsName = @"开发大康师傅好";
    model3.goodsPrice = @(8);
    model3.goodsColor = @"绿色";
    model3.goodsSize = @"M";
    model3.goodsQuantity = @(3);
    
    CartGoodsModel *model4 = [CartGoodsModel new];
    model4.goodsMainImageUrl = @"http://img1.3lian.com/img013/v4/57/d/20.jpg";
    model4.goodsName = @"裤子阿里的房间卡啊大厦法定发贺卡的回复爱的是开发大康师傅好";
    model4.goodsPrice = @(88.88);
    model4.goodsColor = @"蓝色";
    model4.goodsSize = @"XXL";
    model4.goodsQuantity = @(1);
    
    CartGoodsModel *model5 = [CartGoodsModel new];
    model5.goodsMainImageUrl = @"http://img1.3lian.com/img013/v4/57/d/21.jpg";
    model5.goodsName = @"衣服开发大康师傅好";
    model5.goodsPrice = @(8.8);
    model5.goodsColor = @"黄色";
    model5.goodsSize = @"S";
    model5.goodsQuantity = @(2);
    
    CartGoodsModel *model6 = [CartGoodsModel new];
    model6.goodsMainImageUrl = @"http://img1.3lian.com/img013/v4/57/d/22.jpg";
    model6.goodsName = @"开发大康师傅好";
    model6.goodsPrice = @(8);
    model6.goodsColor = @"绿色";
    model6.goodsSize = @"M";
    model6.goodsQuantity = @(3);
    
    CartGoodsModel *model7 = [CartGoodsModel new];
    model7.goodsMainImageUrl = @"http://img1.3lian.com/img013/v4/57/d/23.jpg";
    model7.goodsName = @"裤子阿里的房间卡啊大厦法定发贺卡的回复爱的是开发大康师傅好";
    model7.goodsPrice = @(88.88);
    model7.goodsColor = @"蓝色";
    model7.goodsSize = @"XXL";
    model7.goodsQuantity = @(1);
    
    CartGoodsModel *model8 = [CartGoodsModel new];
    model8.goodsMainImageUrl = @"http://img1.3lian.com/img013/v4/57/d/24.jpg";
    model8.goodsName = @"衣服开发大康师傅好";
    model8.goodsPrice = @(8.8);
    model8.goodsColor = @"黄色";
    model8.goodsSize = @"S";
    model8.goodsQuantity = @(2);
    
    CartGoodsModel *model9 = [CartGoodsModel new];
    model9.goodsMainImageUrl = @"http://img1.3lian.com/img013/v4/57/d/25.jpg";
    model9.goodsName = @"开发大康师傅好";
    model9.goodsPrice = @(8);
    model9.goodsColor = @"绿色";
    model9.goodsSize = @"M";
    model9.goodsQuantity = @(3);
    
    self.cartGoodsArray = [@[model1, model2, model3, model4, model5, model6, model7, model8, model9] mutableCopy];
    self.selectedGoodsArray = [self.cartGoodsArray mutableCopy];
    self.selectedDeleteGoodsArray = [[NSMutableArray alloc] init];
    [self calculatePriceAndQuantity];
    
    if (!_editButton) {
        _editButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _editButton.frame = CGRectMake(0, 0, 40, 40);
        _editButton.titleLabel.font = kSystemFont(15);
        [_editButton setTitle:@"编辑" forState:UIControlStateNormal];
        [_editButton setTitle:@"完成" forState:UIControlStateSelected];
        [_editButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_editButton addTarget:self action:@selector(editButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_editButton];
}
/**
 *  计算价格和数量，及时改变价格和数量
 */
- (void)calculatePriceAndQuantity {
    if (self.selectedGoodsArray.count == self.cartGoodsArray.count) {
        self.selectAllButton.selected = YES;
    } else {
        self.selectAllButton.selected = NO;
    }
    CGFloat price = 0;
    NSInteger quantity = 0;
    for (CartGoodsModel *tempModel in self.selectedGoodsArray) {
        price += ([tempModel.goodsPrice floatValue] * [tempModel.goodsQuantity integerValue]);
        quantity += [tempModel.goodsQuantity integerValue];
    }
    self.totalPriceLabel.text = [NSString stringWithFormat:@"￥%@", [Util numberString:price]];
    if (quantity > 0) {
        [self.deleteOrBalanceButton setTitle:[NSString stringWithFormat:@"结算(%@)", @(quantity)] forState:UIControlStateNormal];
    } else {
        [self.deleteOrBalanceButton setTitle:@"结算" forState:UIControlStateNormal];
    }
    
}
- (void)checkGoods {
    if (self.cartGoodsArray.count == 0) {
        _editButton.selected = NO;
        _editButton.hidden = YES;
        self.bottomViewHeightConstraint.constant = 0;
        [self.tableView reloadData];
    } else {
        _editButton.hidden = NO;
        self.bottomViewHeightConstraint.constant = 52;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UITableView Delegate DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cartGoodsArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 118;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"ShoppingCartCell";
    ShoppingCartCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[ShoppingCartCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    CartGoodsModel *tempModel = self.cartGoodsArray[indexPath.row];
    [cell setupContentWith:tempModel];
    if (_editButton.selected) {
        cell.editQuantityView.hidden = NO;
        if ([self.selectedDeleteGoodsArray containsObject:tempModel]) {
            cell.selectedButton.selected = YES;
        } else {
            cell.selectedButton.selected = NO;
        }
    } else {
        cell.editQuantityView.hidden = YES;
        if ([self.selectedGoodsArray containsObject:tempModel]) {
            cell.selectedButton.selected = YES;
        } else {
            cell.selectedButton.selected = NO;
        }
    }
    //选择和取消选择商品block
    [cell goodsSelect:^(BOOL state) {
        if (state) {
            if (_editButton.selected) {
                [self.selectedDeleteGoodsArray addObject:tempModel];
                if (self.selectedDeleteGoodsArray.count == self.cartGoodsArray.count) {
                    self.selectAllButton.selected = YES;
                }
            } else {
                [self.selectedGoodsArray addObject:tempModel];
                if (self.selectedGoodsArray.count == self.cartGoodsArray.count) {
                    self.selectAllButton.selected = YES;
                }
            }
            
        } else {
            if (_editButton.selected) {
                [self.selectedDeleteGoodsArray removeObject:tempModel];
                if (self.selectAllButton.selected) {
                    self.selectAllButton.selected = NO;
                }
            } else {
                [self.selectedGoodsArray removeObject:tempModel];
                if (self.selectAllButton.selected) {
                    self.selectAllButton.selected = NO;
                }
            }
            
        }
        if (!_editButton.selected) {
            [self calculatePriceAndQuantity];
        }
    }];
    //商品数量编辑block
    [cell goodsQuantityEdit:^(NSInteger goodsQuantity) {
        tempModel.goodsQuantity = @(goodsQuantity);
    }];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"删除";
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        CartGoodsModel *model = self.cartGoodsArray[indexPath.row];
        if ([self.selectedGoodsArray containsObject:model]) {
            [self.selectedGoodsArray removeObject:model];
        }
        if ([self.selectedDeleteGoodsArray containsObject:model]) {
            [self.selectedDeleteGoodsArray removeObject:model];
        }
        [self.cartGoodsArray removeObject:model];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        if (!_editButton.selected) {
            [self calculatePriceAndQuantity];
        }
        [self checkGoods];
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (self.cartGoodsArray.count == 0) {
        return 300;
    } else {
        return 0;
    }
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 300)];
    headerView.backgroundColor = [UIColor clearColor];
    
    UIImageView *emptyImageView = [[UIImageView alloc] init];
    emptyImageView.image = [UIImage imageNamed:@"empty_cart"];
    [headerView addSubview:emptyImageView];
    [emptyImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(headerView.mas_top).with.offset(76);
        make.centerX.equalTo(headerView);
        make.size.mas_equalTo(CGSizeMake(90, 90));
    }];
    
    UILabel *emptyLabel = [[UILabel alloc] init];
    emptyLabel.text = @"空空如也~";
    emptyLabel.font = kSystemFont(15);
    emptyLabel.textColor = kHexRGBColorWithAlpha(0x8c8c8c, 1.0);
    [emptyLabel sizeToFit];
    [headerView addSubview:emptyLabel];
    [emptyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(emptyImageView.mas_bottom).with.offset(25);
        make.centerX.equalTo(headerView);
    }];
    
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
#pragma mark - Action
/**
 *  编辑按钮
 */
- (void)editButtonClick {
    if (_editButton.selected) {
        _editButton.selected = NO;
        self.balanceView.hidden= NO;
        [self calculatePriceAndQuantity];
    } else {
        _editButton.selected = YES;
        self.balanceView.hidden = YES;
        [self.deleteOrBalanceButton setTitle:@"删除" forState:UIControlStateNormal];
        self.selectAllButton.selected = NO;
        [self.selectedDeleteGoodsArray removeAllObjects];
    }
    [self.tableView reloadData];
}
/**
 *  全选按钮
 */
- (IBAction)selectAllClick:(id)sender {
    if (self.selectAllButton.selected) {
        self.selectAllButton.selected = NO;
        if (_editButton.selected) {
            [self.selectedDeleteGoodsArray removeAllObjects];
        } else {
            [self.selectedGoodsArray removeAllObjects];
        }
    } else {
        self.selectAllButton.selected = YES;
        if (_editButton.selected) {
            [self.selectedDeleteGoodsArray removeAllObjects];
            self.selectedDeleteGoodsArray = [self.cartGoodsArray mutableCopy];
        } else {
            [self.selectedGoodsArray removeAllObjects];
            self.selectedGoodsArray = [self.cartGoodsArray mutableCopy];
        }
    }
    [self.tableView reloadData];
    if (!_editButton.selected) {
        [self calculatePriceAndQuantity];
    }
}
- (IBAction)deleteOrBalanceClick:(id)sender {
    if (_editButton.selected) {
        if (self.selectedDeleteGoodsArray.count > 0) {
            for (CartGoodsModel *tempModel in self.selectedDeleteGoodsArray) {
                if ([self.selectedGoodsArray containsObject:tempModel]) {
                    [self.selectedGoodsArray removeObject:tempModel];
                    [self.cartGoodsArray removeObject:tempModel];
                }
            }
            [self.selectedDeleteGoodsArray removeAllObjects];
            [self.tableView reloadData];
            [self checkGoods];
        }
    } else {
        
    }
}

@end

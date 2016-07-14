//
//  MyOrdersViewController.m
//  DongDong
//
//  Created by 项小盆友 on 16/7/13.
//  Copyright © 2016年 项小盆友. All rights reserved.
//

#import "MyOrdersViewController.h"
#import "OrderModel.h"
#import "OrderGoodsModel.h"
#import "MyOrderCell.h"
#import "CommonsDefines.h"
#import <Masonry.h>

@interface MyOrdersViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIButton *button3;
@property (weak, nonatomic) IBOutlet UIButton *button4;
@property (weak, nonatomic) IBOutlet UIButton *button5;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *orderArray;

@end

@implementation MyOrdersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"我的订单";
    [self setButtonsSelected:self.orderType];
    [self setModelData];
}
- (void)setModelData {
    OrderModel *model1 = [OrderModel new];
    model1.orderId = @"1";
    model1.orderNumber = @"1273894728";
    model1.goodsQuantity = @(2);
    model1.orderPrice = @(222.22);
    model1.orderState = @(1);
    
    OrderGoodsModel *goodsModel1 = [OrderGoodsModel new];
    goodsModel1.goodsId = @"1";
    goodsModel1.goodsName = @"阿里肯德基发电机房";
    goodsModel1.goodsQuantity = @(1);
    goodsModel1.goodsMainImage = @"http://img1.3lian.com/img013/v4/57/d/11.jpg";
    goodsModel1.goodsSize = @"XL";
    goodsModel1.goodsColor = @"红色";
    goodsModel1.goodsPrice = @(120.88);
    
    OrderGoodsModel *goodsModel2 = [OrderGoodsModel new];
    goodsModel2.goodsId = @"2";
    goodsModel2.goodsName = @"呀呀呀呀呀呀呀呀呀呀呀呀呀呀呀呀呀呀呀呀呀呀呀呀呀呀呀呀呀呀呀呀";
    goodsModel2.goodsQuantity = @(2);
    goodsModel2.goodsMainImage = @"http://img1.3lian.com/img013/v4/57/d/11.jpg";
    goodsModel2.goodsSize = @"XXL";
    goodsModel2.goodsColor = @"紫色";
    goodsModel2.goodsPrice = @(38.88);
    
    model1.goodsArray = [@[goodsModel1, goodsModel2] copy];
    
    OrderModel *model2 = [OrderModel new];
    model2.orderId = @"2";
    model2.orderNumber = @"1273894729";
    model2.goodsQuantity = @(1);
    model2.orderPrice = @(199.9);
    model2.orderState = @(2);
    
    OrderGoodsModel *goodsModel3 = [OrderGoodsModel new];
    goodsModel3.goodsId = @"4";
    goodsModel3.goodsName = @"阿里肯德基发电机房大量收罚款了的书法家打开减肥哈点开始发货大开发的是开发大上开发卡死的浪费哈迪斯";
    goodsModel3.goodsQuantity = @(1);
    goodsModel3.goodsMainImage = @"http://img1.3lian.com/img013/v4/57/d/1.jpg";
    goodsModel3.goodsSize = @"XL";
    goodsModel3.goodsColor = @"黄色";
    goodsModel3.goodsPrice = @(199.9);
    
    
    model2.goodsArray = [@[goodsModel3] copy];
    
    _orderArray = [@[model1, model2] mutableCopy];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)setButtonsSelected:(NSInteger)index {
    switch (index) {
        case 1:{
            self.button1.selected = YES;
            self.button2.selected = NO;
            self.button3.selected = NO;
            self.button4.selected = NO;
            self.button5.selected = NO;
        }
            break;
        case 2:{
            self.button1.selected = NO;
            self.button2.selected = YES;
            self.button3.selected = NO;
            self.button4.selected = NO;
            self.button5.selected = NO;
        }
            break;
        case 3:{
            self.button1.selected = NO;
            self.button2.selected = NO;
            self.button3.selected = YES;
            self.button4.selected = NO;
            self.button5.selected = NO;
        }
            break;
        case 4:{
            self.button1.selected = NO;
            self.button2.selected = NO;
            self.button3.selected = NO;
            self.button4.selected = YES;
            self.button5.selected = NO;
        }
            break;
        case 5:{
            self.button1.selected = NO;
            self.button2.selected = NO;
            self.button3.selected = NO;
            self.button4.selected = NO;
            self.button5.selected = YES;
        }
            break;
            
        default:
            break;
    }
}
#pragma mark - UITableView Delegate DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _orderArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    OrderModel *tempOrderModel = _orderArray[indexPath.row];
    NSArray *tempArray = tempOrderModel.goodsArray;
    CGFloat height = tempArray.count * 82.0 + 94.0;
    return height;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyOrderCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OrderCell" forIndexPath:indexPath];
    OrderModel *tempOrderModel = _orderArray[indexPath.row];
    [cell setupContentWith:tempOrderModel];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)topButtonClick:(id)sender {
    UIButton *button = (UIButton *)sender;
    if (!button.selected) {
        NSInteger buttonIndex;
        if (button == self.button1) {
            buttonIndex = 1;
        } else if (button == self.button2) {
            buttonIndex = 2;
        } else if (button == self.button3) {
            buttonIndex = 3;
        } else if (button == self.button4) {
            buttonIndex = 4;
        } else if (button == self.button5) {
            buttonIndex = 5;
        }
        [self setButtonsSelected:buttonIndex];
    }
    
}

@end

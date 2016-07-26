//
//  HomepageNavigationController.m
//  DongDong
//
//  Created by 项小盆友 on 16/7/21.
//  Copyright © 2016年 项小盆友. All rights reserved.
//

#import "HomepageNavigationController.h"
#import "GoodsDetailViewController.h"

@interface HomepageNavigationController ()<UINavigationControllerDelegate>

@end

@implementation HomepageNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if ([viewController isKindOfClass:[GoodsDetailViewController class]]) {
        [self setNavigationBarHidden:YES animated:animated];
    } else {
        [self setNavigationBarHidden:NO animated:animated];
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

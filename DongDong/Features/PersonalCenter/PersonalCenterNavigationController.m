//
//  PersonalCenterNavigationController.m
//  DongDong
//
//  Created by 项小盆友 on 16/7/13.
//  Copyright © 2016年 项小盆友. All rights reserved.
//

#import "PersonalCenterNavigationController.h"

@interface PersonalCenterNavigationController ()<UINavigationControllerDelegate>

@end

@implementation PersonalCenterNavigationController

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
    if ([viewController isEqual:[self.viewControllers firstObject]]) {
        [self setNavigationBarHidden:YES animated:animated];
    } else {
        [self setNavigationBarHidden:NO animated:animated];
    }
    viewController.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
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

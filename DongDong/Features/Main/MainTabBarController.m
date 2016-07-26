//
//  MainTabBarController.m
//  DongDong
//
//  Created by 项小盆友 on 16/6/6.
//  Copyright © 2016年 项小盆友. All rights reserved.
//

#import "MainTabBarController.h"
#import "PersonalCenterNavigationController.h"
#import "HomepageNavigationController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : TABBAR_TITLE_COLOR} forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : NAVIGATIONBAR_COLOR} forState:UIControlStateSelected];
    // Do any additional setup after loading the view.
    UIImage *homepageImage = [UIImage imageNamed:@"homepage"];
    homepageImage = [homepageImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *homepageSelectedImage = [UIImage imageNamed:@"homepage_selected"];
    homepageSelectedImage = [homepageSelectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UIImage *shoppingCartImage = [UIImage imageNamed:@"shopping_cart"];
    shoppingCartImage = [shoppingCartImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *shoppingCartSelectedImage = [UIImage imageNamed:@"shopping_cart_selected"];
    shoppingCartSelectedImage = [shoppingCartSelectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UIImage *mineImage = [UIImage imageNamed:@"mine"];
    mineImage = [mineImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *mineSelectedImage = [UIImage imageNamed:@"mine_selected"];
    mineSelectedImage = [mineSelectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //首页
    UIViewController *homepageViewController = [[UIStoryboard storyboardWithName:@"Homepage" bundle:nil] instantiateViewControllerWithIdentifier:@"HomepageView"];
    [self setupChildControllerWith:homepageViewController normalImage:homepageImage selectedImage:homepageSelectedImage title:kHomepage index:0];
    //购物车
    UIViewController *shoppingCartViewController = [[UIStoryboard storyboardWithName:@"ShoppingCart" bundle:nil] instantiateViewControllerWithIdentifier:@"ShoppingCartView"];
    [self setupChildControllerWith:shoppingCartViewController normalImage:shoppingCartImage selectedImage:shoppingCartSelectedImage title:kShoppingCart index:1];
    //我
    UIViewController *mineViewController = [[UIStoryboard storyboardWithName:@"PersonalCenter" bundle:nil] instantiateViewControllerWithIdentifier:@"MineView"];
    [self setupChildControllerWith:mineViewController normalImage:mineImage selectedImage:mineSelectedImage title:kPersonalCenter index:2];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupChildControllerWith:(UIViewController *)childViewController normalImage:(UIImage *)normalImage selectedImage:(UIImage *)selectedImage title:(NSString *)title index:(NSInteger)index {
    if (index == 2) {
        PersonalCenterNavigationController *navigationController = [[PersonalCenterNavigationController alloc] initWithRootViewController:childViewController];
        childViewController.title = title;
        childViewController.tabBarItem.image = normalImage;
        childViewController.tabBarItem.selectedImage = selectedImage;
        [self addChildViewController:navigationController];
    } else if (index == 0) {
        HomepageNavigationController *navigationController = [[HomepageNavigationController alloc] initWithRootViewController:childViewController];
        childViewController.title = title;
        childViewController.tabBarItem.image = normalImage;
        childViewController.tabBarItem.selectedImage = selectedImage;
        [self addChildViewController:navigationController];
    } else {
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:childViewController];
        childViewController.title = title;
        childViewController.tabBarItem.image = normalImage;
        childViewController.tabBarItem.selectedImage = selectedImage;
        [self addChildViewController:navigationController];
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

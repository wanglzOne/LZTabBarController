//
//  AppDelegate.m
//  LZTabBarController
//
//  Created by bhqm on 2017/11/7.
//  Copyright © 2017年 wanglz. All rights reserved.
//

#import "AppDelegate.h"
#import "MianViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"
#import "PushViewController.h"

#import "LZTabBarController.h"

//16进制转UIColor
#define HexAlphaColor(x, a)         [UIColor colorWithRed:((float)(((x) & 0xFF0000) >> 16))/255.0f \
green:((float)(((x) & 0xFF00) >> 8))/255.0f \
blue:((float)((x) & 0xFF))/255.0f \
alpha:(a)]

@interface AppDelegate ()
@property (nonatomic, strong)LZTabBarController *tabBarC;


@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window makeKeyAndVisible];
    
    /*********** 需要在TabBar添加一个"+"  ***********/
    [self ShouldAddTabBarItem];
    
    /*********** 不需要在TabBar添加一个"+" 传统的4个TabBarItem ***********/
//    [self TraditionalTabBarItem];
    
    self.window.rootViewController = self.tabBarC;
    
    return YES;
}

-(void)ShouldAddTabBarItem{
    
    //设置TabBar子控制器
    MianViewController *main = [[MianViewController alloc]init];
    main.view.backgroundColor = [UIColor whiteColor];
    main.tabBarItem.badgeValue = @"23";
    main.title = @"首页";
    main.navigationItem.title = @"首页";
    main.tabBarItem.image = [UIImage imageNamed:@"bottom-0"];
    main.tabBarItem.selectedImage = [UIImage imageNamed:@"bottomon-0"];
    
    SecondViewController *sec = [[SecondViewController alloc]init];
    sec.view.backgroundColor = [UIColor whiteColor];
    sec.tabBarItem.badgeValue = @"2";
    sec.title = @"视频";
    sec.navigationItem.title = @"视频";
    sec.tabBarItem.image = [UIImage imageNamed:@"bottom-1"];
    sec.tabBarItem.selectedImage = [UIImage imageNamed:@"bottomon-1"];
    
    ThirdViewController *third = [[ThirdViewController alloc]init];
    third.view.backgroundColor = [UIColor whiteColor];
    third.tabBarItem.badgeValue = @"3";
    third.title = @"天气";
    third.navigationItem.title = @"天气";
    third.tabBarItem.image = [UIImage imageNamed:@"bottom-3"];
    third.tabBarItem.selectedImage = [UIImage imageNamed:@"bottomon-3"];
    
    FourthViewController *fourth = [[FourthViewController alloc]init];
    fourth.view.backgroundColor = [UIColor whiteColor];
    fourth.tabBarItem.badgeValue = @"66";
    fourth.title = @"我的";
    fourth.navigationItem.title = @"我的";
    fourth.tabBarItem.image = [UIImage imageNamed:@"bottom-4"];
    fourth.tabBarItem.selectedImage = [UIImage imageNamed:@"bottomon-4"];
    
    //添加导航栏控制器
    UINavigationController *navC1 = [[UINavigationController alloc] initWithRootViewController:main];
    UINavigationController *navC2 = [[UINavigationController alloc] initWithRootViewController:sec];
    UINavigationController *navC3 = [[UINavigationController alloc] initWithRootViewController:third];
    UINavigationController *navC4 = [[UINavigationController alloc] initWithRootViewController:fourth];
    
    
    //将导航控制器 添加 为LZTabBar子控制器
    [self.tabBarC addChildViewController:navC1];
    [self.tabBarC addChildViewController:navC2];
    
    /***
     * //在这里添加一个tabBar item 类似 中间添加一个加号"+"
     UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:@"add" image:[UIImage imageNamed:@"bottom-4"] selectedImage:[UIImage imageNamed:@"bottomon-4"]];
     [self.tabBarC.lzTabBar addTabBarItem:item];
     */
    
    [self.tabBarC addChildViewController:navC3];
    [self.tabBarC addChildViewController:navC4];
    
    /***
     //例子 点击加号 (发布)
     self.tabBarC.LZTabbarBlock = ^(NSInteger from, NSInteger to) {
     if (to == 2) {
     PushViewController *vc = [[PushViewController alloc] init];
     // self ---->  [UIApplication sharedApplication].delegate.window.rootViewController
     [[UIApplication sharedApplication].delegate.window.rootViewController presentViewController:vc animated:YES completion:nil];
     }
     };
     
     */
}

-(void)TraditionalTabBarItem{
    MianViewController *main = [[MianViewController alloc]init];
    [self addChildVC:main andtabTitle:@"首页" navTitle:@"新闻资讯" andimage:@"bottom-0" andseledimage:@"bottomon-0"];
    
    SecondViewController *sec = [[SecondViewController alloc]init];
    [self addChildVC:sec andtabTitle:@"视频" navTitle:@"视频" andimage:@"bottom-3" andseledimage:@"bottomon-3"];
    
    ThirdViewController *third = [[ThirdViewController alloc]init];
    [self addChildVC:third andtabTitle:@"天气" navTitle:@"天气" andimage:@"bottom-1" andseledimage:@"bottomon-1"];
    
    FourthViewController *fourth = [[FourthViewController alloc]init];
    [self addChildVC:fourth andtabTitle:@"我的" navTitle:@"我的" andimage:@"bottom-4" andseledimage:@"bottomon-4"];
}

- (void)addChildVC:(UIViewController *)child andtabTitle:(NSString *)tabtitle navTitle:(NSString*)navtitle andimage:(NSString *)image andseledimage:(NSString *)seledimage {
    
    child.tabBarItem.title = tabtitle;
    child.navigationItem.title = navtitle;
    //取消渲染
    child.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    child.tabBarItem.selectedImage = [[UIImage imageNamed:seledimage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [child.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:HexAlphaColor(0xfc4f4f, 1)} forState:UIControlStateSelected];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:child];
    
    nav.navigationBar.barTintColor = HexAlphaColor(0xfc4f4f, 1);
    nav.navigationBar.tintColor = [UIColor redColor];
    
    [child.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    if ([child isKindOfClass:[SecondViewController class]]) {
        child.tabBarItem.badgeValue = @"99+";
    }
    [self.tabBarC addChildViewController:nav];
}



//懒加载
-(LZTabBarController *)tabBarC{
    if (!_tabBarC) {
        _tabBarC = [[LZTabBarController alloc] init];
        
    }
    return _tabBarC;
}



@end

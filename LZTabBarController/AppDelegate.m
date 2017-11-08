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
  
   // self ---->  [UIApplication sharedApplication].delegate.window.rootViewController
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window makeKeyAndVisible];

    [self TraditionalTabBarItem];
    
    self.window.rootViewController = self.tabBarC;

    
    return YES;
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

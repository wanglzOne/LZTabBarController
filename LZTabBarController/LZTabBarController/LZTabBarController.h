//
//  LZTabBarController.h
//  LZTabBarController
//
//  Created by bhqm on 2017/11/7.
//  Copyright © 2017年 wanglz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LZTabBar.h"


@interface LZTabBarController : UITabBarController

/***  LZTabbarBlock(获取点击item的tag) */
@property (nonatomic, strong) void (^LZTabbarBlock)(NSInteger from,NSInteger to);

/***  自定义TabBar(LZTabBar) */
@property (nonatomic, strong) LZTabBar *lzTabBar;

/***  TabBar item 标题颜色 */
@property (nonatomic, strong) UIColor *itemTitleColor;

/***  TabBar item 选中时标题颜色  */
@property (nonatomic, strong) UIColor *selectedItemTitleColor;

/***  TabBar item 标题字体大小   */
@property (nonatomic, strong) UIFont *itemTitleFont;

/***  TabBar item 标记字体大小  */
@property (nonatomic, strong) UIFont *badgeTitleFont;

/***  TabBar item 图片比例   */
@property (nonatomic, assign) CGFloat itemImageRatio;

/**
 *  System will display the original controls so you should call this line when you change any tabBar item, like: `- popToRootViewController`, `someViewController.tabBarItem.title = xx`, etc.
 *  Remove origin controls
 */
/***    在当前控制器返回根视图控制器(LZTabBarController)       */
- (void)removeOriginControls NS_DEPRECATED_IOS(2_0, 11_0, "Method deprecated. For iOS 11.0+, framework will process it automatically.");

@end
